import 'package:flutter/material.dart';

class WorkoutDetailsScreen extends StatelessWidget {
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




  WorkoutDetailsScreen({
    required this.workoutoftheday, required this.day, required this.Set1, required this.Set1reps, required this.Set1weight1, required this.Set1weight2, required this.Set1weight3, required this.Set2, required this.Set2reps, required this.Set2weight1, required this.Set2weight2, required this.Set2weight3, required this.Set3, required this.Set3reps, required this.Set3weight1, required this.Set3weight2, required this.Set3weight3, required this.Set4, required this.Set4reps, required this.Set4weight1, required this.Set4weight2, required this.Set4weight3, required this.Set5, required this.Set5reps, required this.Set5weight1, required this.Set5weight2, required this.Set5weight3,


});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text ("$day's $workoutoftheday Workout"),
      ),
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Workout Summary"),
                        Text("$workoutoftheday"),
                        Text("$Set1"),
                        Text("$Set1reps"),
                        Text("$Set1weight1"),
                        Text("$Set1weight2"),
                        Text("$Set1weight3"),
                        Text("$Set2"),
                        Text("$Set2reps"),
                        Text("$Set2weight1"),
                        Text("$Set2weight2"),
                        Text("$Set2weight3"),
                        Text("$Set3"),
                        Text("$Set3reps"),
                        Text("$Set3weight1"),
                        Text("$Set3weight2"),
                        Text("$Set3weight3"),
                        Text("$Set4"),
                        Text("$Set4reps"),
                        Text("$Set4weight1"),
                        Text("$Set4weight2"),
                        Text("$Set4weight3"),
                        Text("$Set5"),
                        Text("$Set5reps"),
                        Text("$Set5weight1"),
                        Text("$Set5weight2"),
                        Text("$Set5weight3"),
      ],
    ),
        )
    )
    );
  }
}
