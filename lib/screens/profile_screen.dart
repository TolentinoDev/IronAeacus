import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:ironaeacus/screens/workoutlog_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  String email = ' lala';
  String firstname = ' ';
  String lastname = ' ';
  String weight = ' ';

  String gender = 'Male';

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        email = loggedInUser.email.toString();
        print(email);
      }
    } catch (exception) {
      //email = loggedInUser.email.toString();
      print(exception);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.blueGrey[700],
        body: Column(

            //mainAxisAlignment: MainAxisAlignment.,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome firstname!",
                    style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/$gender.png'),
                radius: 100,

    ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile (
                    leading: Icon(Icons.person,
                  ),
    title: Text("Ryan Tolentino",style: TextStyle(fontSize: 30)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile (
                    leading: Icon(Icons.email,
                    ),
                    title: Text("$email",style: TextStyle(fontSize: 30)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile (
                    leading: Icon(Icons.scale,
                    ),
                    title: Text("Fatty",style: TextStyle(fontSize: 30)),),
                ),
              ),


              ]
        )
          );


  }
}
