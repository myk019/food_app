import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/commons/images.dart';
import 'package:food_app/on_body/screen/onbody_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../main.dart';

class OnBodyScreen extends StatefulWidget {
  const OnBodyScreen({super.key});

  @override
  State<OnBodyScreen> createState() => _OnBodyScreenState();
}

class _OnBodyScreenState extends State<OnBodyScreen> {

  int onPageIndex=0;
  PageController onPageController= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(IconConst.SplashIcon,height: w*0.07,width: w*0.07,),
        centerTitle: true,
        actions: [
          onPageIndex==2?SizedBox():
          GestureDetector(
            onTap: () {
              onPageController.jumpToPage(2);
            },
            child: Container(
              color: Colors.transparent,
              child: Center(
                widthFactor: w*0.007,
                child: Text("Skip",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: w*0.045,
                  color: colors.Red
                ),),
              ),
            ),
          )
        ],
      ),
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: onPageController,
        padEnds: false,
        itemCount: contents.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
          onPageIndex=index;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              contents[index].text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: w*0.07
              ),),
            Container(
              // color: Colors.blue,
              height: h*0.45,
              width: w*1,
              child: Image(image: AssetImage(contents[index].image)),
            ),
            // SizedBox(height: w*0.02,),
            AnimatedSmoothIndicator(
              activeIndex: onPageIndex,
                count:  contents.length,
                effect:  ScrollingDotsEffect(
                    activeDotColor:colors.Green,
                    dotColor: colors.Grey2,
                    dotHeight: w*0.02,
                    dotWidth: w*0.02
                )
            ),
            SizedBox(height: w*0.05,),
            Column(
              children: [
                Container(
                  height: h*0.065,
                  width: w*0.93,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3,0.7],
                        colors:[
                          Color(0xffF9881F),
                          Color(0xffFF774C)
                        ]),
                    borderRadius: BorderRadius.circular(w*0.06)
                  ),
                  child: Center(
                      child: Text("Create an account",
                        style: TextStyle(
                        fontSize: w*0.045,
                          fontWeight: FontWeight.w600,
                          color: colors.White
                      ),)),
                ),
                SizedBox(height: w*0.05,),
                Container(
                  height: h*0.065,
                  width: w*0.93,
                  decoration: BoxDecoration(
                   color: Colors.transparent,
                    borderRadius: BorderRadius.circular(w*0.06)
                  ),
                  child: Center(
                    child: Text("login",
                    style: TextStyle(
                      fontSize: w*0.045,
                      fontWeight: FontWeight.w600,
                      color: colors.Red
                    ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: w*0.1,)
          ],
        );

      },
      ),
    );
  }
}
