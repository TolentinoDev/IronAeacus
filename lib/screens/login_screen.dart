import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email Address'
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
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15)
                  ) ,
                  child: Center(
                      child: Text('Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)
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