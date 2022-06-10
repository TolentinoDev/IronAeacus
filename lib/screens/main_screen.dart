import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ironaeacus/screens/workout_screen.dart';
import 'package:ironaeacus/widgets/workout_tile.dart';
import 'package:ironaeacus/widgets/workout_type.dart';


class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String selectedWorkout;

  final List workoutType = [
    [
    'Chest',
      true
  ],
    [
      'Biceps',
      false
    ],
    [
      'Calves',
      false
    ],
    [
      'Shoulders',
      false
    ],
    [
      'Abs',
      false
    ],
  ];

  void workoutTypeSelected(int index){
    setState(() {
      for (int i = 0; i < workoutType.length; i++){
        workoutType[i][1] = false;
      }
      workoutType[index][1] = true;
      selectedWorkout = workoutType[index][0];
    }

    );

  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser () async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);

    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(

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
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
Padding(
  padding: const EdgeInsets.only(top: 10.0),
  child:   Text("Select your desired muscle group",

      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)



  ),
),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: workoutType.length,
              itemBuilder: (context, index) {
            return WorkoutType(
              workoutType: workoutType[index][0],
              isSelected: workoutType[index][1],
              onTap: (){
                workoutTypeSelected(index);
              },
            );
          }
          ),
        ),
        Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15)
            ) ,
        child:
        MaterialButton(
            onPressed: () {
              print("You've selected $selectedWorkout");
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutScreen(selectedWorkout: selectedWorkout))
              );
            },
            child:Text('Start',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)))
        )
            ]
      )

    );
  }
}

