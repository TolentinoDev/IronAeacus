import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:ironaeacus/widgets/workout_tile.dart';

class WorkoutType extends StatelessWidget {
  final String workoutType;
  final bool isSelected;

  late final VoidCallback onTap;

  WorkoutType({
    required this.workoutType,
    required this.isSelected,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
    child: GestureDetector(
    onTap: onTap,
    child: Column(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(15)
        ) ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              child: Text(workoutType, style:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.orange: Colors.black
              ),
              ),
            ),

            CircleAvatar(
              backgroundImage: AssetImage('lib/images/$workoutType.png'),
              radius: 50,
            )
          ],
        ),
      ),
      ]
    )
    ));

  }
}