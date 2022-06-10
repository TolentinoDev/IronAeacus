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
    //color: Colors.deepOrange[200],
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(15)
      ) ,
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
              Text('10'),
              Text('10'),
            ],
          ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
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
