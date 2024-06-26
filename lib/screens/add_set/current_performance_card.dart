import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/workout_model.dart';
import '../../models/theme_model.dart';
import '../../app_localizations.dart';
import 'package:provider/provider.dart';

class CurrentPerformanceCard extends StatelessWidget {
  final List<Workout> currentWorkouts;
  final Color iconColor;
  final BorderSide cardBorder;

  const CurrentPerformanceCard({
    super.key,
    required this.currentWorkouts,
    required this.iconColor,
    required this.cardBorder,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final workoutModel = Provider.of<WorkoutModel>(context, listen: false);
    final themeModel = Provider.of<ThemeModel>(context);

    // Fetch all previous workouts for the current exercise
    List<Workout> previousWorkouts = workoutModel.previousWorkoutsExcludingToday
        .where((workout) => workout.exercise.name == currentWorkouts.first.exercise.name)
        .toList();

    // Group previous workouts by date
    Map<DateTime, List<Workout>> groupedPreviousWorkouts = {};
    for (var workout in previousWorkouts) {
      DateTime date = DateTime(workout.date.year, workout.date.month, workout.date.day);
      if (!groupedPreviousWorkouts.containsKey(date)) {
        groupedPreviousWorkouts[date] = [];
      }
      groupedPreviousWorkouts[date]!.add(workout);
    }

    // Get the latest date's workouts
    DateTime? latestDate = groupedPreviousWorkouts.keys.isNotEmpty
        ? groupedPreviousWorkouts.keys.reduce((a, b) => a.isAfter(b) ? a : b)
        : null;

    List<Workout> latestPreviousWorkouts = latestDate != null ? groupedPreviousWorkouts[latestDate]! : [];

    // Ensure the length of latestPreviousWorkouts matches currentWorkouts by filling with dummy data if necessary
    while (latestPreviousWorkouts.length < currentWorkouts.length) {
      latestPreviousWorkouts.add(Workout(
        exercise: currentWorkouts.first.exercise,
        repetitions: 0,
        weight: 0.0,
        restTime: Duration(seconds: 0),
        date: latestDate ?? DateTime.now(),
      ));
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: cardBorder,
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalizations?.translate('current_performance') ?? 'Current Performance',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (currentWorkouts.isNotEmpty) ...[
              for (int i = 0; i < currentWorkouts.length; i++) ...[
                Row(
                  children: [
                    Icon(Icons.format_list_numbered, color: iconColor),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '${appLocalizations?.translate('set')} ${i + 1}: ${currentWorkouts[i].repetitions} reps, ${currentWorkouts[i].weight} kg',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    if (i < latestPreviousWorkouts.length) ...[
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        padding: EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: themeModel.isDark ? Colors.black.withOpacity(0.7) : Colors.white.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              appLocalizations?.translate('percentage_change') ?? 'Percentage Change',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: themeModel.isDark ? Colors.white : Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              appLocalizations?.translate('percentage_change_explanation') ??
                                                  'This percentage represents the change in volume (weight x repetitions) between the previous and current workouts. A positive percentage indicates an improvement, while a negative percentage indicates a decrease in performance.',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: themeModel.isDark ? Colors.white70 : Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 16.0),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                child: Text(
                                                  appLocalizations?.translate('close') ?? 'Close',
                                                  style: TextStyle(color: Colors.blue),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              '${workoutModel.calculateVolumePercentageChange(latestPreviousWorkouts[i], currentWorkouts[i]).toStringAsFixed(1)}%',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: workoutModel.calculateVolumePercentageChange(latestPreviousWorkouts[i], currentWorkouts[i]) >= 0
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: iconColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        DateFormat.yMMMd().add_Hm().format(currentWorkouts[i].date),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ] else ...[
              Text(
                appLocalizations?.translate('no_workouts_today') ?? 'No workouts today',
                style: const TextStyle(fontSize: 16.0),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
