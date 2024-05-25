import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/workout_model.dart';
import 'dart:collection';
import 'package:intl/intl.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  Exercise? _selectedExercise;

  List<FlSpot> _generatePerformanceSpots(WorkoutModel workoutModel, Exercise exercise) {
    final workouts = workoutModel.workouts.where((workout) => workout.exercise == exercise).toList();
    workouts.sort((a, b) => a.date.compareTo(b.date));
    return workouts
        .asMap()
        .entries
        .map<FlSpot>((entry) => FlSpot(entry.key.toDouble(), entry.value.repetitions * entry.value.weight))
        .toList();
  }

  List<BarChartGroupData> _generateWeeklyProgress(WorkoutModel workoutModel) {
    final Map<String, double> weeklyProgress = {};

    for (var workout in workoutModel.workouts) {
      String day = DateFormat.E().format(workout.date);
      if (!weeklyProgress.containsKey(day)) {
        weeklyProgress[day] = 0.0;
      }
      weeklyProgress[day] = weeklyProgress[day]! + workout.weight * workout.repetitions;
    }

    List<BarChartGroupData> barGroups = [];
    int index = 0;
    weeklyProgress.forEach((day, totalWeight) {
      barGroups.add(BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: totalWeight,
            color: Colors.blue,
          ),
        ],
        showingTooltipIndicators: [0],
      ));
      index++;
    });

    return barGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<WorkoutModel>(
          builder: (context, workoutModel, child) {
            final exercises = workoutModel.exercises;
            final performanceSpots = _selectedExercise != null ? _generatePerformanceSpots(workoutModel, _selectedExercise!) : <FlSpot>[];
            final weeklyProgressBars = _generateWeeklyProgress(workoutModel);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Exercise',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Exercise>(
                        hint: const Text('Select Exercise'),
                        value: _selectedExercise,
                        onChanged: (Exercise? newValue) {
                          setState(() {
                            _selectedExercise = newValue;
                          });
                        },
                        items: exercises.map((Exercise exercise) {
                          return DropdownMenuItem<Exercise>(
                            value: exercise,
                            child: Text(exercise.name),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (_selectedExercise != null) ...[
                    Text(
                      '${_selectedExercise!.name} Performance Progress',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            getDrawingHorizontalLine: (value) {
                              return const FlLine(
                                color: Color(0xffe7e8ec),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return const FlLine(
                                color: Color(0xffe7e8ec),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toStringAsFixed(0),
                                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                                    overflow: TextOverflow.visible,
                                  );
                                },
                                interval: performanceSpots.isNotEmpty ? ((performanceSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b)) / 10) : 100,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 22,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toStringAsFixed(0),
                                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                                    overflow: TextOverflow.visible,
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: const Color(0xffe7e8ec)),
                          ),
                          minX: 0,
                          maxX: performanceSpots.isNotEmpty ? performanceSpots.length - 1.toDouble() : 0,
                          minY: performanceSpots.isNotEmpty ? performanceSpots.map((e) => e.y).reduce((a, b) => a < b ? a : b) : 0,
                          maxY: performanceSpots.isNotEmpty ? performanceSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b) : 0,
                          lineBarsData: [
                            LineChartBarData(
                              spots: performanceSpots,
                              isCurved: true,
                              color: Colors.blue,
                              barWidth: 4,
                              belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
                            ),
                          ],
                          lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                                return touchedSpots.map((spot) {
                                  return LineTooltipItem(
                                    '${spot.x.toStringAsFixed(0)}, ${spot.y.toStringAsFixed(0)}',
                                    const TextStyle(color: Colors.white),
                                  );
                                }).toList();
                              },
                            ),
                            touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                              if (touchResponse != null && touchResponse.lineBarSpots != null) {
                                final value = touchResponse.lineBarSpots!.first;
                                setState(() {
                                  // Update something based on the touch event if needed
                                });
                              }
                            },
                            handleBuiltInTouches: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 32),
                  Text(
                    'Weekly Progress Overview',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        barGroups: weeklyProgressBars,
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                                return Text(days[value.toInt()]);
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toStringAsFixed(0),
                                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                                  overflow: TextOverflow.visible,
                                );
                              },
                            ),
                          ),
                        ),
                        gridData: FlGridData(show: true),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
