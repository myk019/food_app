import 'package:flutter/material.dart';

import '../../main.dart';

class Curvepage extends StatefulWidget {
  const Curvepage({super.key});

  @override
  State<Curvepage> createState() => _CurvepageState();
}

class _CurvepageState extends State<Curvepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                height: h*1,
                width: w*0.5,
                color: Colors.black.withOpacity(0.3),
              ),
              Container(
                height: h*1,
                width: w*0.5,
                color: Colors.teal,
              ),
              ]
              ),
              Positioned(
                top: w*2,
                child: Column(
                  children: [
                    Container(
                      height: h*0.3,
                      width: w*1,
                      color: Colors.teal
                      ,
                    ),
                    Container(
                      height: h*0.7,
                      width: w*1,
                      color: Colors.white
                      ,
                    )
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
