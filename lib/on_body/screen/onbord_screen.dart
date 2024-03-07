import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/auth/screen/create_account.dart';
import 'package:food_app/auth/screen/login_account.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/commons/images.dart';
import 'package:food_app/on_body/screen/onbord_content.dart';
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
      backgroundColor: colors.Background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(IconConst.SplashIcon,height: w*0.07,width: w*0.07,),
        centerTitle: true,
        actions: [
          onPageIndex==2?const SizedBox():
          GestureDetector(
            onTap: () {
              onPageIndex=2;
              onPageController.jumpToPage(2);
              setState(() {

              });
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
      body: Column(
        children: [
          SizedBox(
            height: h*0.6,
            child: PageView.builder(
              onPageChanged: (value) {
                onPageIndex=value;
                setState(() {
                });
              },
              physics: const BouncingScrollPhysics(),
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
                  onPageIndex!=2?SizedBox(
                    // color: Colors.blue,
                    height: h*0.45,
                    width: w*1,
                    child: Image(image: AssetImage(contents[index].image)),
                  ):Stack(
                    children: [
                      Positioned(
                        bottom: w*0.001,
                        right: w*0.14,
                        child: Center(
                          child: Container(
                            height: h*0.44,
                            width: w*0.72,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colors.Red2,
                                width: w*0.004
                              )
                            ),

                          ),
                        ),
                      ),
                      SizedBox(
                        // color: Colors.blue,
                        height: h*0.45,
                        width: w*1,
                        child: Image(image: AssetImage(contents[index].image)),
                      )
                    ],
                  ),
                ],
              );
            },
            ),
          ),
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
          SizedBox(height: h*0.055,),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoDialogRoute(builder: (context) => CreatePage(), context: context));
                },
                child: Container(
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
              ),
              SizedBox(height: w*0.05,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoDialogRoute(builder: (context) => LoginPage(), context: context));
                },
                child: Container(
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
              ),
            ],
          ),

        ],
      ),
    );
  }
}
