import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/workout_screen.dart';
import 'package:ironaeacus/models/workout.dart';

class WorkoutData extends ChangeNotifier {

  List <Workout> chest = [
   Workout(workoutName: "Bench Press", reps: '10', weight1: '0', weight2: '0', weight3: '0'),
    Workout(workoutName: "Incline Bench Press", reps: '10', weight1: '0', weight2: '0', weight3: '0'),
    Workout(workoutName: "Push Ups", reps: '10', weight1: '0', weight2: '0', weight3: '0'),
    Workout(workoutName: "Decline Bench Press", reps: '10', weight1: '0', weight2: '0', weight3: '0'),
    Workout(workoutName: "Cable Flys", reps: '10', weight1: '0', weight2: '0', weight3: '0'),

  ];
  void updateWorkout(Workout workout){
    notifyListeners();
  }
}