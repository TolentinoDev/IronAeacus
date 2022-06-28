import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:ironaeacus/screens/main_screen.dart';
import 'package:ironaeacus/screens/workoutlog_screen.dart';
import 'package:ironaeacus/screens/profile_screen.dart';
class navigation extends StatefulWidget {
  static String id = 'navigation_screen';

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  List<ScreenHiddenDrawer> pages = [];
@override
void initState() {
  super.initState();
  
  pages = [
    ScreenHiddenDrawer(ItemHiddenMenu(name: 'Workout',baseStyle: TextStyle(),selectedStyle: TextStyle()), MainScreen()),
    ScreenHiddenDrawer(ItemHiddenMenu(name: 'Workout Log', baseStyle: TextStyle(),selectedStyle: TextStyle()), WorkoutlogScreen()),
    ScreenHiddenDrawer(ItemHiddenMenu(name: 'Profile', baseStyle: TextStyle(),selectedStyle: TextStyle()), ProfileScreen()),
  ];
}
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepOrange[200],
      screens: pages,
      initPositionSelected: 0,
      slidePercent: 40,
    );
  }
}
