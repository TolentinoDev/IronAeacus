import 'package:flutter/material.dart';
import 'package:ironaeacus/widgets/workout_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:ironaeacus/screens/navigation.dart';


class WorkoutScreen extends StatefulWidget {
  String selectedWorkout;
  WorkoutScreen({required this.selectedWorkout});
  static String id = 'workout_screen';

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState(selectedWorkout);
}

List Chest = [
  [
    'Bench Press',
    '10',
    '0',
    '0',
    '0'

  ],
  [
    'Incline Bench Press',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Push Ups',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Decline Bench Press',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Cable Flys',
    '10',
    '0',
    '0',
    '0'
  ],
];

List Calves = [
  [
    'Squats',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Front Squats',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Romanian Deadlift',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Leg Extensions',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Calf Raises',
    '10',
    '0',
    '0',
    '0'
  ],
];

List Biceps = [
  [
    'Dumbell Curl',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Lateral Pulldown',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Romanian Deadlift',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Leg Extensions',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Calf Raises',
    '10',
    '0',
    '0',
    '0'
  ],
];

List Shoulders = [
  [
    'Shoulder Press',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Lateral Pulldown',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Romanian Deadlift',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Leg Extensions',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Calf Raises',
    '10',
    '0',
    '0',
    '0'
  ],
];

List Abs = [
  [
    'Crunches',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Leg Lifts',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Decline Sit-ups',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Hanging Knee raise',
    '10',
    '0',
    '0',
    '0'
  ],
  [
    'Bicycle Kicks',
    '10',
    '0',
    '0',
    '0'
  ],
];



class _WorkoutScreenState extends State<WorkoutScreen> {
  int bottomnavbarIndex = 0;
  late String selectedWorkout;
  String weight1 = '240';
  String weight2 = '240';
  String weight3 = '240';
  final _firestore = FirebaseFirestore.instance;
  List tryme = [];
  List empty = [];
  bool setlogged = false;
  String test = 'no issues';
  FirebaseAuth auth = FirebaseAuth.instance;
  var user = FirebaseAuth.instance.currentUser!.email;




  void toggleTextboxState(String weight1state,String weight2state,String weight3state){
    setState(() {
      weight1 = weight1state;
      print(weight1state);
      weight2 = weight2state;
      print(weight2state);
      weight3 = weight3state;
      print(weight3state);
    });
  }

  _WorkoutScreenState(this.selectedWorkout);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text('$selectedWorkout workout'),

      ),

      body: Column(

        children: [
          Expanded(

            child: ListView.builder(itemCount: 5, itemBuilder: (context, index){
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

              return Column(
                children: [
                  WorkoutTile(
                    workoutName: tryme[index][0],
                    reps:tryme[index][1],
                    weight1state: tryme[index][2],
                    weight2state: tryme[index][3],
                    weight3state: tryme[index][4],
                    textboxCallback: toggleTextboxState,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Set 1: ' + tryme[index][2],
                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Set 2: ' + tryme[index][3],
                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Set 3: ' + tryme[index][4], style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
              child: DecoratedBox
              (decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
                      child: MaterialButton(
                        onPressed: () {
                          setState ((){
                            print('logging set');
                            tryme[index][2] = weight1;
                            print('weight 1' + weight1);
                            tryme[index][3] = weight2;
                            print('weight 2' + weight2);
                            tryme[index][4] = weight3;
                            print('weight 3' + weight3);
                          });

                        },
                        child:Text('Log Set',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white )),
                      ),
                    )),
                  )
                ],
              );

            }

            ),

          ),
          FloatingActionButton.extended(onPressed:() {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text("Workout logged"),
              );;
            });
            try {
    _firestore.collection('profile/$user/workoutlogs').add({
    'workoutoftheday': selectedWorkout,
    'day': DateFormat('MEd').format(DateTime.now()),
    'Set1': tryme[0][0],
    'Set1 reps': tryme[0][1],
    'Set1 weight1': tryme[0][2],
    'Set1 weight2': tryme[0][3],
    'Set1 weight3': tryme[0][4],


    'Set2': tryme[1][0],
    'Set2 reps': tryme[1][1],
    'Set2 weight1': tryme[1][2],
    'Set2 weight2': tryme[1][3],
    'Set2 weight3': tryme[1][4],

    'Set3': tryme[2][0],
    'Set3 reps': tryme[2][1],
    'Set3 weight1': tryme[2][2],
    'Set3 weight2': tryme[2][3],
    'Set3 weight3': tryme[2][4],

    'Set4': tryme[3][0],
    'Set4 reps': tryme[3][1],
    'Set4 weight1': tryme[3][2],
    'Set4 weight2': tryme[3][3],
    'Set4 weight3': tryme[3][4],

    'Set5': tryme[4][0],
    'Set5 reps': tryme[4][1],
    'Set5 weight1': tryme[4][2],
    'Set5 weight2': tryme[4][3],
    'Set5 weight3': tryme[4][4],

    });
    tryme = empty;

    Navigator.pushNamed(context, navigation.id);
            }

            catch(e){
              print (e);
              test = e.toString();
              Navigator.of(context).pop();
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(test),
                );
              });

            }

    },

            label: Text("Log workout"),
            icon: Icon(Icons.celebration),


          )

        ],
      ),
    );
  }
}
