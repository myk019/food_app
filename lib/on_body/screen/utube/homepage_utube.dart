import 'package:flutter/material.dart';
import 'package:food_app/homePage.dart';
import 'package:food_app/on_body/screen/bottom_navigation.dart';
import 'package:food_app/on_body/screen/utube/drawer_screen.dart';

import 'home_Screen.dart';

class HomePageUtube extends StatefulWidget {
  const HomePageUtube({super.key});

  @override
  State<HomePageUtube> createState() => _HomePageUtubeState();
}

class _HomePageUtubeState extends State<HomePageUtube> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           DrawerScreen(),
          NavigationPage()
        ],
      ),
    );
  }
}
