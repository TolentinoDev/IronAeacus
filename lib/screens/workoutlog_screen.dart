import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:ironaeacus/screens/profile_screen.dart';
import 'package:ironaeacus/screens/workoutdetails_screen.dart';


class WorkoutlogScreen extends StatefulWidget {
  static String id = 'workoutlog_screen';

  @override
  State<WorkoutlogScreen> createState() => _WorkoutlogScreenState();
}



class _WorkoutlogScreenState extends State<WorkoutlogScreen> {
  int bottomnavbarIndex = 0;
  final firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String workoutoftheday;
  late String day;
  FirebaseAuth auth = FirebaseAuth.instance;
  var user = FirebaseAuth.instance.currentUser!.email;

  void nav(int index) {
    setState((){
      bottomnavbarIndex = index;
      print(pages[index]);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => pages[index])
      );
    });
  }
  final List pages = [
    WorkoutlogScreen(),
    MainScreen(),
    ProfileScreen(),
  ];

  void workoutStream() async {
    await for (var snapshot in firestore.collection('profile/$user/workoutlogs').snapshots()){
      for (var workoutlog in snapshot.docs){
        print(workoutlog.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder <QuerySnapshot>(
              stream: firestore.collection('profile/$user/workoutlogs').snapshots(),
              builder: (context, snapshot) {
    if (snapshot.hasData) {
      final workoutlogs = snapshot.data!.docs;

    List<WorkoutlogView> workoutlogWidgets = [];

    for (var workoutlog in workoutlogs) {
      final workoutlogNameText = workoutlog['workoutoftheday'];
      final workoutlogDayText = workoutlog['day'];
      final workoutlogSet1Text = workoutlog['Set1'];
      final workoutlogSet1repsText = workoutlog['Set1 reps'];
      final workoutlogSet1weight1Text = workoutlog['Set1 weight1'];
      final workoutlogSet1weight2Text = workoutlog['Set1 weight2'];
      final workoutlogSet1weight3Text = workoutlog['Set1 weight3'];
      final workoutlogSet2Text = workoutlog['Set2'];
      final workoutlogSet2repsText = workoutlog['Set2 reps'];
      final workoutlogSet2weight1Text = workoutlog['Set2 weight1'];
      final workoutlogSet2weight2Text = workoutlog['Set2 weight2'];
      final workoutlogSet2weight3Text = workoutlog['Set2 weight3'];
      final workoutlogSet3Text = workoutlog['Set3'];
      final workoutlogSet3repsText = workoutlog['Set3 reps'];
      final workoutlogSet3weight1Text = workoutlog['Set3 weight1'];
      final workoutlogSet3weight2Text = workoutlog['Set3 weight2'];
      final workoutlogSet3weight3Text = workoutlog['Set3 weight3'];
      final workoutlogSet4Text = workoutlog['Set4'];
      final workoutlogSet4repsText = workoutlog['Set4 reps'];
      final workoutlogSet4weight1Text = workoutlog['Set4 weight1'];
      final workoutlogSet4weight2Text = workoutlog['Set4 weight2'];
      final workoutlogSet4weight3Text = workoutlog['Set4 weight3'];
      final workoutlogSet5Text = workoutlog['Set5'];
      final workoutlogSet5repsText = workoutlog['Set5 reps'];
      final workoutlogSet5weight1Text = workoutlog['Set5 weight1'];
      final workoutlogSet5weight2Text = workoutlog['Set5 weight2'];
      final workoutlogSet5weight3Text = workoutlog['Set5 weight3'];

    final workoutlogWidget = WorkoutlogView(
    workoutoftheday: workoutlogNameText,
    day: workoutlogDayText,
      Set1: workoutlogSet1Text,
      Set1reps: workoutlogSet1repsText,
      Set1weight1: workoutlogSet1weight1Text,
      Set1weight2: workoutlogSet1weight2Text,
      Set1weight3: workoutlogSet1weight3Text,
      Set2: workoutlogSet2Text,
      Set2reps: workoutlogSet2repsText,
      Set2weight1: workoutlogSet2weight1Text,
      Set2weight2: workoutlogSet2weight2Text,
      Set2weight3: workoutlogSet2weight3Text,
      Set3: workoutlogSet3Text,
      Set3reps: workoutlogSet3repsText,
      Set3weight1: workoutlogSet3weight1Text,
      Set3weight2: workoutlogSet3weight2Text,
      Set3weight3: workoutlogSet3weight3Text,
      Set4: workoutlogSet4Text,
      Set4reps: workoutlogSet4repsText,
      Set4weight1: workoutlogSet4weight1Text,
      Set4weight2: workoutlogSet4weight2Text,
      Set4weight3: workoutlogSet4weight3Text,
      Set5: workoutlogSet5Text,
      Set5reps: workoutlogSet5repsText,
      Set5weight1: workoutlogSet5weight1Text,
      Set5weight2: workoutlogSet5weight2Text,
      Set5weight3: workoutlogSet5weight3Text,
    );

    workoutlogWidgets.add(workoutlogWidget);
    print(workoutlog.id);
    }

    return Expanded(
    child: ListView(
    children: workoutlogWidgets,
    ),
    );
                }
                throw 'There are no logged workouts';
              })
          ]
        ),
      ),
    );
  }
}

class WorkoutlogView extends StatelessWidget{

  final String workoutoftheday;
  final String day;
  final String Set1;
  final String Set1reps;
  final String Set1weight1;
  final String Set1weight2;
  final String Set1weight3;
  final String Set2;
  final String Set2reps;
  final String Set2weight1;
  final String Set2weight2;
  final String Set2weight3;
  final String Set3;
  final String Set3reps;
  final String Set3weight1;
  final String Set3weight2;
  final String Set3weight3;
  final String Set4;
  final String Set4reps;
  final String Set4weight1;
  final String Set4weight2;
  final String Set4weight3;
  final String Set5;
  final String Set5reps;
  final String Set5weight1;
  final String Set5weight2;
  final String Set5weight3;

  WorkoutlogView(
  {
  required this.workoutoftheday,
  required this.day, required this.Set1, required this.Set1reps, required this.Set1weight1, required this.Set1weight2, required this.Set1weight3, required this.Set2, required this.Set2reps, required this.Set2weight1, required this.Set2weight2, required this.Set2weight3, required this.Set3, required this.Set3reps, required this.Set3weight1, required this.Set3weight2, required this.Set3weight3, required this.Set4, required this.Set4reps, required this.Set4weight1, required this.Set4weight2, required this.Set4weight3, required this.Set5, required this.Set5reps, required this.Set5weight1, required this.Set5weight2, required this.Set5weight3
}
      );

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Material(
          color: Colors.deepOrangeAccent[200],
          child: TextButton(
            onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetailsScreen(
                    workoutoftheday: workoutoftheday,
                    day:day,
                    Set1: Set1,
                    Set1reps: Set1reps,
                    Set1weight1: Set1weight1,
                    Set1weight2: Set1weight2,
                    Set1weight3: Set1weight3,
                    Set2: Set2,
                    Set2reps: Set2reps,
                    Set2weight1: Set2weight1,
                    Set2weight2: Set2weight2,
                    Set2weight3: Set2weight3,
                    Set3: Set3,
                    Set3reps: Set3reps,
                    Set3weight1: Set3weight1,
                    Set3weight2: Set3weight2,
                    Set3weight3: Set3weight3,
                    Set4: Set4,
                    Set4reps: Set4reps,
                    Set4weight1: Set4weight1,
                    Set4weight2: Set4weight2,
                    Set4weight3: Set4weight3,
                    Set5: Set5,
                    Set5reps: Set5reps,
                    Set5weight1: Set5weight1,
                    Set5weight2: Set5weight2,
                    Set5weight3: Set5weight3,

                  )
                )
              );
            },
            child: Text("$day's $workoutoftheday workout",
                style: TextStyle(fontSize: 10.0, color: Colors.white)),
          ),
        ),
      )
    );
  }


}

