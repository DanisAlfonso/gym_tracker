import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/workout_model.dart';
import '../app_localizations.dart';

class RecoveryStatus extends StatelessWidget {
  const RecoveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutModel = Provider.of<WorkoutModel>(context);
    final appLocalizations = AppLocalizations.of(context);
    final recoveryPercentages = workoutModel.calculateRecoveryPercentagePerMuscleGroup();

    // Sort recoveryPercentages by value
    final sortedRecoveryPercentages = recoveryPercentages.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final iconColor = isDarkMode ? Colors.white : theme.primaryColor;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardBorder = BorderSide(color: theme.dividerColor.withOpacity(0.5));

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: cardBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.hotel, color: iconColor), // Adjusted icon color based on theme
                const SizedBox(width: 8),
                Text(
                  appLocalizations?.translate('recovery_status') ?? 'Recovery Status',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...sortedRecoveryPercentages.map((entry) {
              final muscleGroupDescription = entry.key;
              final localizationKey = _findLocalizationKeyForDescription(muscleGroupDescription, workoutModel.exercises);
              final translatedKey = appLocalizations?.translate(localizationKey) ?? muscleGroupDescription;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        translatedKey,
                        style: TextStyle(fontSize: 16, color: textColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${entry.value.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 16,
                        color: entry.value >= 100 ? Colors.green : Colors.orange,
                      ),
                    ),
                  ],
                ),
              );
            }),
            if (recoveryPercentages.isEmpty)
              Text(
                appLocalizations?.translate('no_recent_workouts') ?? 'No recent workouts to show recovery status.',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  String _findLocalizationKeyForDescription(String description, List<Exercise> exercises) {
    final exercise = exercises.firstWhere(
          (e) => e.description == description,
      orElse: () => Exercise(name: '', description: description, localizationKey: description, recoveryTimeInHours: 0),
    );
    return "${exercise.localizationKey}_description";
  }
}
