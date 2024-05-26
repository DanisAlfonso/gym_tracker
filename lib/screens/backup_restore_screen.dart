// backup_restore_screen.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackupRestoreScreen extends StatefulWidget {
  @override
  _BackupRestoreScreenState createState() => _BackupRestoreScreenState();
}

class _BackupRestoreScreenState extends State<BackupRestoreScreen> {
  Future<void> _backupData() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> data = {
      'workouts': prefs.getString('workouts'),
      'routines': prefs.getString('routines'),
      'exercises': prefs.getString('exercises'),
      'userProfile': {
        'name': prefs.getString('name'),
        'age': prefs.getInt('age'),
        'weight': prefs.getDouble('weight'),
        'height': prefs.getDouble('height'),
      },
      'workoutPreferences': {
        'useKg': prefs.getBool('useKg'),
        'defaultRestMinutes': prefs.getInt('defaultRestMinutes'),
        'defaultRestSeconds': prefs.getInt('defaultRestSeconds'),
        'workoutReminders': prefs.getBool('workoutReminders'),
      },
      'appPreferences': {
        'isDarkMode': prefs.getBool('isDarkMode'),
        'notificationsEnabled': prefs.getBool('notificationsEnabled'),
        'selectedLanguage': prefs.getString('selectedLanguage'),
      },
    };
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/backup.json');
    await file.writeAsString(jsonEncode(data));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Backup Successful')),
    );
  }

  Future<void> _restoreData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/backup.json');
    if (await file.exists()) {
      final data = jsonDecode(await file.readAsString());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('workouts', data['workouts']);
      await prefs.setString('routines', data['routines']);
      await prefs.setString('exercises', data['exercises']);
      await prefs.setString('name', data['userProfile']['name']);
      await prefs.setInt('age', data['userProfile']['age']);
      await prefs.setDouble('weight', data['userProfile']['weight']);
      await prefs.setDouble('height', data['userProfile']['height']);
      await prefs.setBool('useKg', data['workoutPreferences']['useKg']);
      await prefs.setInt('defaultRestMinutes', data['workoutPreferences']['defaultRestMinutes']);
      await prefs.setInt('defaultRestSeconds', data['workoutPreferences']['defaultRestSeconds']);
      await prefs.setBool('workoutReminders', data['workoutPreferences']['workoutReminders']);
      await prefs.setBool('isDarkMode', data['appPreferences']['isDarkMode']);
      await prefs.setBool('notificationsEnabled', data['appPreferences']['notificationsEnabled']);
      await prefs.setString('selectedLanguage', data['appPreferences']['selectedLanguage']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Restore Successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No Backup Found')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backup and Restore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _backupData,
              child: Text('Backup Data'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _restoreData,
              child: Text('Restore Data'),
            ),
          ],
        ),
      ),
    );
  }
}
