import 'package:flutter/material.dart';
import 'package:ironaeacus/screens/welcome_screen.dart';
import 'package:ironaeacus/screens/login_screen.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:ironaeacus/screens/profile_screen.dart';
import 'package:ironaeacus/screens/register_screen.dart';
import 'package:ironaeacus/screens/workout_screen.dart';
import 'package:ironaeacus/screens/workoutlog_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ironaeacus/models/workout.dart';
import 'package:provider/provider.dart';
import 'package:ironaeacus/models/workout_data.dart';
import 'package:ironaeacus/screens/navigation.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(IronAeacus());
}

class IronAeacus extends StatelessWidget {
  const IronAeacus({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WorkoutData(),
      child: MaterialApp(

          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
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
                WorkoutScreen(selectedWorkout: 'Testing'),
            'workoutlog_screen': (context) =>
                WorkoutlogScreen(),
            'main_screen': (context) =>
                MainScreen(),
            'navigation_screen': (context) =>
                navigation(),
          }
      ),
    );
  }
}