import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';

import '../../../commons/icons.dart';
import '../../../main.dart';

class HomeScreenUtube extends StatefulWidget {
  const HomeScreenUtube({super.key});

  @override
  State<HomeScreenUtube> createState() => _HomeScreenUtubeState();
}

class _HomeScreenUtubeState extends State<HomeScreenUtube> {


  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;

  bool isDrawerOpen=false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(

      transform: Matrix4.translationValues( xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.only(left: w*0.03,right: w*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                 isDrawerOpen?GestureDetector(
                   onTap: () {

                     xOffset=0;
                     yOffset=0;
                     scaleFactor=1;
                     isDrawerOpen=false;
                     setState(() {

                     });

                   },
                   child:SvgPicture.asset(
                     IconConst.leftArrow,
                     height: w*0.075,
                     width: w*0.099,
                   ),
                 ) :GestureDetector(
                    onTap: () {

                      xOffset=230;
                      yOffset=150;
                      scaleFactor=0.6;
                      isDrawerOpen=true;

                      setState(() {

                      });

                    },
                    child:SvgPicture.asset(
                      IconConst.drawerr,
                      height: w*0.05,
                      width: w*0.09,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Delivery to",
                        style: TextStyle(color: colors.Black, fontSize: w * 0.03),
                      ),
                      Text(
                        "lekki phase 1, Estate",
                        style: TextStyle(color: colors.Red, fontSize: w * 0.03),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: w * 0.02,
                    backgroundColor: colors.White,
                    child: SvgPicture.asset(IconConst.googleIcon),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );

  }
}
