import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ironaeacus/screens/navigation.dart';

// Tolentino, Ryan (2021). Aloha Illio. Unpublished, Florida Institute of Technology,
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  String test = 'no issues';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                  Icons.sports_gymnastics,
                  size: 50
              ),
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
                          keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value){
                          email = value;

                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email Address',
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Container(
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
                          try{
                            final newUser =  await _auth.signInWithEmailAndPassword(email: email, password: password);
                            if (newUser != null) {
                              Navigator.pushNamed(context, navigation.id);
                              //Navigator.of(context).pop();

                            }
                          }
                          catch (e){
                            print (e);
                            test = e.toString();
                            Navigator.of(context).pop();
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(test),
                              );
                            });

                          }


                        },
                    child:Text('Sign in',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

                )

                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Forgot password?",
                  style: TextStyle(color: Colors.blue, fontSize: 10))

            ],),
        ),
      ),
    );
  }
}