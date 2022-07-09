import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:ironaeacus/screens/navigation.dart';
import 'package:ironaeacus/screens/welcome_screen.dart';
import 'package:ironaeacus/screens/workoutlog_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ironaeacus/models/get_username.dart';
import 'package:ironaeacus/screens/login_screen.dart';
class ProfileScreen extends StatelessWidget {

  static String id = 'profile_screen';
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!.email;
  final docRef = FirebaseFirestore.instance.collection("profile").doc('user');
  //var user = FirebaseAuth.instance.currentUser.;
  String firstname = ' ';
  String lastname = ' ';
  String weight = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.blueGrey[700],
        body: Column(

            //mainAxisAlignment: MainAxisAlignment.,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile (
                    leading: Icon(Icons.person,
                  ),
    title: GetFirstName()),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile (
                      leading: Icon(Icons.person,
                      ),
                      title: GetLastName()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile (
                    leading: Icon(Icons.email,
                    ),
                    title: Text("$user",style: TextStyle(fontSize: 30)),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile (
                    leading: Icon(Icons.scale,
                    ),
                    title: GetWeight()),
     ),

              ),
              MaterialButton(
                  onPressed: () async {
                    showDialog(context: context, builder: (context) {
                      return Center(child: CircularProgressIndicator());
                    });
                    await _auth.signOut();
                    Navigator.pushNamed(context, WelcomeScreen.id);
                    //Navigator.of(context).pop();

                  },
                  child:Text('Logout',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

              )

              ]
        )
          );


  }
}
