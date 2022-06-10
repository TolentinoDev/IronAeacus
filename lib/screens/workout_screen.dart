

import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/workout_screen.dart';
import 'package:ironaeacus/widgets/workout_tile.dart';


class WorkoutScreen extends StatefulWidget {
  String selectedWorkout;
  //List tryme = [];
  WorkoutScreen({required this.selectedWorkout});
  static String id = 'workout_screen';

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState(selectedWorkout);
}

List Chest = [
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

List Calves = [
  [
    'Squats',
  ],
  [
    'Front Squats',
  ],
  [
    'Romanian Deadlift',
  ],
  [
    'Leg Extensions',
  ],
  [
    'Calf Raises',
  ],
];

List Biceps = [
  [
    'Dumbell Curl',
  ],
  [
    'Lateral Pulldown',
  ],
  [
    'Romanian Deadlift',
  ],
  [
    'Leg Extensions',
  ],
  [
    'Calf Raises',
  ],
];

List Shoulders = [
  [
    'Shoulder Press',
  ],
  [
    'Lateral Pulldown',
  ],
  [
    'Romanian Deadlift',
  ],
  [
    'Leg Extensions',
  ],
  [
    'Calf Raises',
  ],
];

List Abs = [
  [
    'Crunches',
  ],
  [
    'Leg Lifts',
  ],
  [
    'Decline Sit-ups',
  ],
  [
    'Hanging Knee raise',
  ],
  [
    'Bicycle Kicks',
  ],
];



class _WorkoutScreenState extends State<WorkoutScreen> {
  late String selectedWorkout;
  List tryme = [];


  _WorkoutScreenState(this.selectedWorkout);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
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

            child: ListView.builder(itemCount: tryme.length, itemBuilder: (context, index){
              if (selectedWorkout == 'Chest'){
                print(selectedWorkout);
                tryme = Chest;
                print(tryme);
              }
              if (selectedWorkout == 'Calves'){
                print(selectedWorkout);
                tryme = Calves;
                print(tryme);
              }
              if (selectedWorkout == 'Shoulders'){
                print(selectedWorkout);
                tryme = Shoulders;
                print(tryme);
              }
              if (selectedWorkout == 'Biceps'){
                print(selectedWorkout);
                tryme = Biceps;
                print(tryme);
              }
              if (selectedWorkout == 'Abs'){
                print(selectedWorkout);
                tryme = Abs;
                print(tryme);
              }
              return WorkoutTile(workoutName: tryme[index][0]);
            }),
          ),
    Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(15)
    ) ,
        child: MaterialButton(
            onPressed: () {

              print("You've selected $selectedWorkout");
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutScreen(selectedWorkout: selectedWorkout))
              );
            },
            child:Text('Finish Workout',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)))
    )
        ],
      ),
    );
  }
}
