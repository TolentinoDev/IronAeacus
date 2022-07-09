
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

