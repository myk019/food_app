import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:food_app/homePage.dart';
import 'package:food_app/navigations/screen/bottom_navigation.dart';

import 'drawer_screen.dart';


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
