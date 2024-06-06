import 'workout_model.dart';

final List<Exercise> defaultExercises = [
  // Abdominals
  Exercise(name: 'Cable Crunch', description: 'Abdominals', localizationKey: 'exercise_cable_crunch', recoveryTimeInHours: 48),
  Exercise(name: 'Decline Crunch', description: 'Abdominals', localizationKey: 'exercise_decline_crunch', recoveryTimeInHours: 48),
  Exercise(name: 'Hanging Knee Raise', description: 'Abdominals', localizationKey: 'exercise_hanging_knee_raise', recoveryTimeInHours: 48),
  Exercise(name: 'Hanging Leg Raise', description: 'Abdominals', localizationKey: 'exercise_hanging_leg_raise', recoveryTimeInHours: 48),
  // Adductors
  Exercise(name: 'Hip Adduction (Machine)', description: 'Adductors', localizationKey: 'exercise_hip_adduction_machine', recoveryTimeInHours: 48),
  // Biceps
  Exercise(name: 'Concentration Curl', description: 'Biceps', localizationKey: 'exercise_concentration_curl', recoveryTimeInHours: 48),
  Exercise(name: 'Bicep Curl (Barbell)', description: 'Biceps', localizationKey: 'exercise_bicep_curl_barbell', recoveryTimeInHours: 48),
  Exercise(name: 'Bicep Curl (Cable)', description: 'Biceps', localizationKey: 'exercise_bicep_curl_cable', recoveryTimeInHours: 48),
  Exercise(name: 'Seated Incline Curl', description: 'Biceps', localizationKey: 'exercise_seated_incline_curl', recoveryTimeInHours: 48),
  Exercise(name: 'EZ Bar Curl', description: 'Biceps', localizationKey: 'exercise_ez_bar_curl', recoveryTimeInHours: 48),
  Exercise(name: 'Hammer Curl (Dumbbell)', description: 'Biceps', localizationKey: 'exercise_hammer_curl_dumbbell', recoveryTimeInHours: 48),
  Exercise(name: 'Overhead Curl (Cable)', description: 'Biceps', localizationKey: 'exercise_overhead_curl_cable', recoveryTimeInHours: 48),
  Exercise(name: 'Preacher Curl', description: 'Biceps', localizationKey: 'exercise_preacher_curl', recoveryTimeInHours: 48),
  Exercise(name: 'Reverse Curl', description: 'Biceps', localizationKey: 'exercise_reverse_curl', recoveryTimeInHours: 48),
  Exercise(name: 'Single Arm Curl (Cable)', description: 'Biceps', localizationKey: 'exercise_single_arm_curl_cable', recoveryTimeInHours: 48),
  // Calves
  Exercise(name: 'Calf Press (Machine)', description: 'Calves', localizationKey: 'exercise_calf_press_machine', recoveryTimeInHours: 48),
  Exercise(name: 'Seated Calf Raise', description: 'Calves', localizationKey: 'exercise_seated_calf_raise', recoveryTimeInHours: 48),
  Exercise(name: 'Single Leg Standing Calf Raise', description: 'Calves', localizationKey: 'exercise_single_leg_standing_calf_raise', recoveryTimeInHours: 48),
  Exercise(name: 'Single Leg Standing Calf Raise (Machine)', description: 'Calves', localizationKey: 'exercise_single_leg_standing_calf_raise_machine', recoveryTimeInHours: 48),
  Exercise(name: 'Standing Calf Raise (Machine)', description: 'Calves', localizationKey: 'exercise_standing_calf_raise_machine', recoveryTimeInHours: 48),
  // Chest
  Exercise(name: 'Bench Press (Barbell)', description: 'Chest', localizationKey: 'exercise_bench_press_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Bench Press (Dumbbell)', description: 'Chest', localizationKey: 'exercise_bench_press_dumbbell', recoveryTimeInHours: 72),
  Exercise(name: 'Bench Press (Smith Machine)', description: 'Chest', localizationKey: 'exercise_bench_press_smith_machine', recoveryTimeInHours: 72),
  Exercise(name: 'Chest Dip', description: 'Chest', localizationKey: 'exercise_chest_dip', recoveryTimeInHours: 72),
  Exercise(name: 'Chest Fly (Dumbbell)', description: 'Chest', localizationKey: 'exercise_chest_fly_dumbbell', recoveryTimeInHours: 72),
  Exercise(name: 'Incline Bench Press (Barbell)', description: 'Chest', localizationKey: 'exercise_incline_bench_press_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Incline Bench Press (Dumbbell)', description: 'Chest', localizationKey: 'exercise_incline_bench_press_dumbbell', recoveryTimeInHours: 72),
  Exercise(name: 'Incline Bench Press (Smith Machine)', description: 'Chest', localizationKey: 'exercise_incline_bench_press_smith_machine', recoveryTimeInHours: 72),
  Exercise(name: 'Incline Chest Fly (Dumbbell)', description: 'Chest', localizationKey: 'exercise_incline_chest_fly_dumbbell', recoveryTimeInHours: 72),
  Exercise(name: 'Iso-Lateral Chest (Machine)', description: 'Chest', localizationKey: 'exercise_iso_lateral_chest_machine', recoveryTimeInHours: 72),
  // Glutes
  Exercise(name: 'Hip Thrust (Barbell)', description: 'Glutes', localizationKey: 'exercise_hip_thrust_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Hip Thrust (Machine)', description: 'Glutes', localizationKey: 'exercise_hip_thrust_machine', recoveryTimeInHours: 72),
  // Hamstrings
  Exercise(name: 'Deadlift (Barbell)', description: 'Hamstrings', localizationKey: 'exercise_deadlift_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Lying Leg Curl (Machine)', description: 'Hamstrings', localizationKey: 'exercise_lying_leg_curl_machine', recoveryTimeInHours: 48),
  Exercise(name: 'Reverse Lunge (Barbell)', description: 'Hamstrings', localizationKey: 'exercise_reverse_lunge_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Reverse Lunge (Dumbbell)', description: 'Hamstrings', localizationKey: 'exercise_reverse_lunge_dumbbell', recoveryTimeInHours: 72),
  Exercise(name: 'Romanian Deadlift (Barbell)', description: 'Hamstrings', localizationKey: 'exercise_romanian_deadlift_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Seated Leg Curl (Machine)', description: 'Hamstrings', localizationKey: 'exercise_seated_leg_curl_machine', recoveryTimeInHours: 48),
  // Lats
  Exercise(name: 'Chin Up', description: 'Lats', localizationKey: 'exercise_chin_up', recoveryTimeInHours: 72),
  Exercise(name: 'Chin Up (Weighted)', description: 'Lats', localizationKey: 'exercise_chin_up_weighted', recoveryTimeInHours: 72),
  Exercise(name: 'Lat Pulldown - Close Grip (Cable)', description: 'Lats', localizationKey: 'exercise_lat_pulldown_close_grip_cable', recoveryTimeInHours: 72),
  Exercise(name: 'Lat Pulldown (Cable)', description: 'Lats', localizationKey: 'exercise_lat_pulldown_cable', recoveryTimeInHours: 72),
  Exercise(name: 'Pull Up', description: 'Lats', localizationKey: 'exercise_pull_up', recoveryTimeInHours: 72),
  Exercise(name: 'Pull Up (Weighted)', description: 'Lats', localizationKey: 'exercise_pull_up_weighted', recoveryTimeInHours: 72),
  Exercise(name: 'Rope Straight Arm Pulldown', description: 'Lats', localizationKey: 'exercise_rope_straight_arm_pulldown', recoveryTimeInHours: 72),
  // Quadriceps
  Exercise(name: 'Full Squat', description: 'Quadriceps', localizationKey: 'exercise_full_squat', recoveryTimeInHours: 72),
  Exercise(name: 'Hack Squat (Machine)', description: 'Quadriceps', localizationKey: 'exercise_hack_squat_machine', recoveryTimeInHours: 72),
  Exercise(name: 'Leg Extension (Machine)', description: 'Quadriceps', localizationKey: 'exercise_leg_extension_machine', recoveryTimeInHours: 48),
  Exercise(name: 'Leg Press (Machine)', description: 'Quadriceps', localizationKey: 'exercise_leg_press_machine', recoveryTimeInHours: 72),
  Exercise(name: 'Lunge (Barbell)', description: 'Quadriceps', localizationKey: 'exercise_lunge_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Lunge (Dumbbell)', description: 'Quadriceps', localizationKey: 'exercise_lunge_dumbbell', recoveryTimeInHours: 72),
  Exercise(name: 'Pause Squat (Barbell)', description: 'Quadriceps', localizationKey: 'exercise_pause_squat_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Pendulum Squat (Machine)', description: 'Quadriceps', localizationKey: 'exercise_pendulum_squat_machine', recoveryTimeInHours: 72),
  Exercise(name: 'Squat (Smith Machine)', description: 'Quadriceps', localizationKey: 'exercise_squat_smith_machine', recoveryTimeInHours: 72),
  Exercise(name: 'Squat (Dumbbell)', description: 'Quadriceps', localizationKey: 'exercise_squat_dumbbell', recoveryTimeInHours: 72),
  // Shoulders
  Exercise(name: 'Shoulder (Machine Plates)', description: 'Shoulders', localizationKey: 'exercise_shoulder_machine_plates', recoveryTimeInHours: 48),
  Exercise(name: 'Single Arm Lateral Raise (Cable)', description: 'Shoulders', localizationKey: 'exercise_single_arm_lateral_raise_cable', recoveryTimeInHours: 48),
  Exercise(name: 'Standing Military Press (Barbell)', description: 'Shoulders', localizationKey: 'exercise_standing_military_press_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Face Pull', description: 'Shoulders', localizationKey: 'exercise_face_pull', recoveryTimeInHours: 48),
  Exercise(name: 'Lateral Raise (Dumbbell)', description: 'Shoulders', localizationKey: 'exercise_lateral_raise_dumbbell', recoveryTimeInHours: 48),
  Exercise(name: 'Lateral Raise (Machine)', description: 'Shoulders', localizationKey: 'exercise_lateral_raise_machine', recoveryTimeInHours: 48),
  Exercise(name: 'Seated Lateral Raise (Dumbbell)', description: 'Shoulders', localizationKey: 'exercise_seated_lateral_raise_dumbbell', recoveryTimeInHours: 48),
  Exercise(name: 'Seated Press (Dumbbell)', description: 'Shoulders', localizationKey: 'exercise_seated_press_dumbbell', recoveryTimeInHours: 72),
  // Traps
  Exercise(name: 'Shrug (Barbell)', description: 'Traps', localizationKey: 'exercise_shrug_barbell', recoveryTimeInHours: 48),
  Exercise(name: 'Shrug (Dumbbell)', description: 'Traps', localizationKey: 'exercise_shrug_dumbbell', recoveryTimeInHours: 48),
  // Triceps
  Exercise(name: 'Bench Press - Close Grip', description: 'Triceps', localizationKey: 'exercise_bench_press_close_grip', recoveryTimeInHours: 72),
  Exercise(name: 'Single Arm Tricep Extension (Dumbbell)', description: 'Triceps', localizationKey: 'exercise_single_arm_tricep_extension_dumbbell', recoveryTimeInHours: 48),
  Exercise(name: 'Single Arm Tricep Pushdown (Cable)', description: 'Triceps', localizationKey: 'exercise_single_arm_tricep_pushdown_cable', recoveryTimeInHours: 48),
  Exercise(name: 'Skullcrusher (Dumbbell)', description: 'Triceps', localizationKey: 'exercise_skullcrusher_dumbbell', recoveryTimeInHours: 48),
  Exercise(name: 'Skullcrusher (Barbell)', description: 'Triceps', localizationKey: 'exercise_skullcrusher_barbell', recoveryTimeInHours: 48),
  Exercise(name: 'Triceps Extension (Cable)', description: 'Triceps', localizationKey: 'exercise_triceps_extension_cable', recoveryTimeInHours: 48),
  Exercise(name: 'Triceps Pushdown', description: 'Triceps', localizationKey: 'exercise_triceps_pushdown', recoveryTimeInHours: 48),
  Exercise(name: 'Triceps Rope Pushdown', description: 'Triceps', localizationKey: 'exercise_triceps_rope_pushdown', recoveryTimeInHours: 48),
  // Upper Back
  Exercise(name: 'Seated Cable Row - Bar Grip', description: 'Upper Back', localizationKey: 'exercise_seated_cable_row_bar_grip', recoveryTimeInHours: 72),
  Exercise(name: 'Seated Cable Row - V Grip (Cable)', description: 'Upper Back', localizationKey: 'exercise_seated_cable_row_v_grip_cable', recoveryTimeInHours: 72),
  Exercise(name: 'Bent Over Row (Barbell)', description: 'Upper Back', localizationKey: 'exercise_bent_over_row_barbell', recoveryTimeInHours: 72),
  Exercise(name: 'Bent Over Row (Dumbbell)', description: 'Upper Back', localizationKey: 'exercise_bent_over_row_dumbbell', recoveryTimeInHours: 72),
  Exercise(name: 'Rear Delt Reverse Fly (Dumbbell)', description: 'Upper Back', localizationKey: 'exercise_rear_delt_reverse_fly_dumbbell', recoveryTimeInHours: 48),
  Exercise(name: 'Rear Delt Reverse Fly (Machine)', description: 'Upper Back', localizationKey: 'exercise_rear_delt_reverse_fly_machine', recoveryTimeInHours: 48),
  Exercise(name: 'Reverse Grip Lat Pulldown (Cable)', description: 'Upper Back', localizationKey: 'exercise_reverse_grip_lat_pulldown_cable', recoveryTimeInHours: 72),
];
