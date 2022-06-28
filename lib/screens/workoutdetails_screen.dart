import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:ironaeacus/screens/profile_screen.dart';
import 'package:ironaeacus/screens/workoutdetails_screen.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final String workoutoftheday;
  final String day;

  WorkoutDetailsScreen({
    required this.workoutoftheday, required this.day

});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text ("$day's $workoutoftheday Workout"),
      ),
          body: SingleChildScrollView(
        child: Column(
        children: [
          ListTile(
            leading: Container(
                child: Text("$workoutoftheday")
            ),
    )
      ],
    )
    )
    );
  }
}
