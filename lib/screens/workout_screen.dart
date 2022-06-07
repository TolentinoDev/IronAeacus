import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/workout_screen.dart';
import 'package:ironaeacus/widgets/workout_tile.dart';


class WorkoutScreen extends StatefulWidget {
  String selectedWorkout;
  WorkoutScreen({required this.selectedWorkout});
  static String id = 'workout_screen';

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState(selectedWorkout);
}

final List chest = [
  [
    'Bench Press',
  ],
  [
    'Incline Bench Press',
  ],
  [
    'Push Ups',
  ],
  [
    'Decline Bench Press',
  ],
  [
    'Cable Flys',
  ],
];

class _WorkoutScreenState extends State<WorkoutScreen> {
  late String selectedWorkout;
  _WorkoutScreenState(this.selectedWorkout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('$selectedWorkout'),
        ),


    bottomNavigationBar: BottomNavigationBar(
    items: [
    BottomNavigationBarItem(icon: Icon(Icons.note),
    label: 'Past Workouts',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.home),
    label: 'Home',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.face),
    label: 'Profile',
    ),

    ],
    ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: chest.length, itemBuilder: (context, index){
              return WorkoutTile(workoutName: chest[index][0]);
            }),
          ),
        ],
      ),
    );
  }
}
