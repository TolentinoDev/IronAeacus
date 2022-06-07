import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ironaeacus/widgets/workout_tile.dart';

class WorkoutTile extends StatelessWidget {
  final String workoutName;

  WorkoutTile({
    required this.workoutName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
    height: 200,
    color: Colors.deepOrange[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Workout'),
              Text('$workoutName'),
              Text('$workoutName'),
              Text('$workoutName'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Reps'),
              Text('10'),
              Text('20'),
              Text('30'),
            ],
          ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text('Weight'),
                ),
            SizedBox(

              width: 55,
              height: 40,

              child: TextField(
                textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        border: OutlineInputBorder()
                      ),
                    ),
            ),
                SizedBox(
                  width: 55,
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,


                    decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(
                  width: 55,
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,


                    decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),

      ),

    );
    }

  }
