import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ironaeacus/screens/navigation.dart';

// Yu, D. A. (2021). The complete 2021 flutter development bootcamp with Dart. Udemy. Retrieved July 27, 2022, from https://www.udemy.com/share/101WB63@KiWgQPgFpwJTbiSsyAyZd8vEuF1ut-iPL88neXwt84jf7QBpYiV-sgGSzvAkV3x-FQ==/
class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String firstname;
  late String lastname;
  late String email;
  String gender = "male";
  late String  weight;
  late String password;
  String test = 'no issues';
  String uid = '1';


  DateTime _selectedDate = DateTime(2022, 12, 24);
  String startingText = 'Enter Your Birthday!' ;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null){
        return;
      }
      setState (() {
        _selectedDate = pickedDate;
        startingText = DateFormat.yMd().format(_selectedDate);
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                    Icons.sports_gymnastics,
                    size: 50
                ),
                SizedBox(height: 10),
                Text("Iron Aeacus!",
                    style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)),
                Text("A free beginner workout application!",
                    style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value){
                          firstname = value;

                        },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First Name',
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(15)
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MaterialButton(height: 10, minWidth: 500, onPressed: _presentDatePicker, child: Text(startingText)),
                      ),
                      ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            lastname = value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Last Name'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Male",
                        style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)),Radio(value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                    ),
                    Text("Female",
                        style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)),Radio(value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    Text("Other",
                        style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)),Radio(value: "Other",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            weight = value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Weight'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            email = value;

                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value){
                            password = value;

                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password'
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(15)
                    ) ,
                    child: Center(
                        child: MaterialButton(
                            onPressed: () async {
                              showDialog(context: context, builder: (context) {
                                return Center(child: CircularProgressIndicator());
                              });
                              try{
                                final newUser =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                if (newUser != null) {
                                  final test = FirebaseFirestore.instance.collection('profile').doc(email);
                                  final json = {
                                    'email': email,
                                    'firstname':firstname,
                                    'gender':gender,
                                    'lastname': lastname,
                                    'weight':weight
                                  };
                                  await test.set(json);

                                  }
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => navigation(),
                                  ),);
                              }
                              catch (e){
                                test = e.toString();
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(test),
                                  );
                                });
                              };

                              
                            },
                            child:Text('Register',
                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

                        )
                    ),
                  ),
                ),
              ],),
          ),
        ),
      ),
    );
  }
}
