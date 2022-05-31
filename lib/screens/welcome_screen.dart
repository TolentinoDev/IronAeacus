import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ironaeacus/screens/login_screen.dart';
import 'package:ironaeacus/screens/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Text("Iron Aeacus",
            style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)),
              Text("A free beginner workout application!",
                  style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                        child: MaterialButton(
                        onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                  },
                      child:Text('Login',
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

                  )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[400],
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:
                    Center(
                        child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterScreen.id);
                            },
                            child:Text('Register',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

                        )
                    ),

                  ),
                ),
              ),

            ],),
        ),
      ),
    );
  }
}
