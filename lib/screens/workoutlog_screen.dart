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
    await for (var snapshot in firestore.collection('workoutlogs').snapshots()){
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
              stream: firestore.collection('workoutlogs').snapshots(),
              builder: (context, snapshot) {
    if (snapshot.hasData) {
    final workoutlogs = snapshot.data!.docs;

    List<WorkoutlogView> workoutlogWidgets = [];

    for (var workoutlog in workoutlogs) {
      final workoutlogNameText = workoutlog['workoutoftheday'];
    final workoutlogDayText = workoutlog['day'];


    final workoutlogWidget = WorkoutlogView(
    workoutoftheday: workoutlogNameText,
    day: workoutlogDayText,
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
  WorkoutlogView(
  {
  required this.workoutoftheday,
  required this.day
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
                    day:day
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

