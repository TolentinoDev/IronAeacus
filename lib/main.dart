import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/welcome_screen.dart';
import 'package:ironaeacus/screens/login_screen.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:ironaeacus/screens/profile_screen.dart';
import 'package:ironaeacus/screens/register_screen.dart';
import 'package:ironaeacus/screens/workout_screen.dart';
import 'package:ironaeacus/screens/workoutlog_screen.dart';
void main() {
  runApp(IronAeacus());
}

class IronAeacus extends StatelessWidget {
  const IronAeacus({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) =>
              WelcomeScreen(),
          LoginScreen.id: (context) =>
              LoginScreen(),
          'register_screen': (context) =>
              RegisterScreen(),
          'profile_screen': (context) =>
              ProfileScreen(),
          'workout_screen': (context) =>
              WorkoutScreen(),
          'workoutlog_screen': (context) =>
              WorkoutScreen(),
          'main_screen': (context) =>
              MainScreen(),
        }
    );
  }
}