import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ProfileScreen extends StatelessWidget {

  static String id = 'profile_screen';
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!.email;
  final docRef = FirebaseFirestore.instance.collection("profile").doc('user');
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
    Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.deepOrange[400],
    borderRadius: BorderRadius.circular(15)
    ) ,
    child: Center(
              child: MaterialButton(
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

    ),
    ),

              ]
        )
          );


  }
}


class GetFirstName extends StatelessWidget {

  final firestore = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('profile');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user).get(),
      builder: ((context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['firstname']}',style: TextStyle(fontSize: 30));
        }
        return Text ('loading');
      }),
    );
  }
}

class GetLastName extends StatelessWidget {

  final firestore = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('profile');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user).get(),
      builder: ((context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['lastname']}',style: TextStyle(fontSize: 30));
        }
        return Text ('loading');
      }),
    );
  }
}

class GetWeight extends StatelessWidget {

  final firestore = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('profile');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user).get(),
      builder: ((context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['weight']}',style: TextStyle(fontSize: 30));
        }
        return Text ('loading');
      }),
    );
  }
}

class GetGender extends StatelessWidget {

  final firestore = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('profile');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user).get(),
      builder: ((context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          var test =  Text('${data['gender']}',style: TextStyle(fontSize: 30)) as Widget;
          return test;
        }

        return Text ('loading');
      }),
    );
  }
}
