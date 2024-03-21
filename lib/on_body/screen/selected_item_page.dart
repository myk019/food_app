import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/on_body/screen/your_cart_page.dart';

import '../../commons/icons.dart';
import '../../commons/images.dart';
import '../../main.dart';

class SelectedItemPage extends StatefulWidget {
  const SelectedItemPage({super.key});

  @override
  State<SelectedItemPage> createState() => _SelectedItemPageState();
}

class _SelectedItemPageState extends State<SelectedItemPage> {
  int selectedIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      appBar: AppBar(
        backgroundColor: colors.Background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              IconConst.leftArrow,
              height: w*0.03,
              width: w*0.06,
            ),
          ),
        ),
        title: Column(
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
        centerTitle: true,
        actions: [
          SizedBox(
            height: w * 0.12,
            width: w * 0.12,
            // color: colors.Red,
            child: CircleAvatar(
              radius: w * 0.02,
              backgroundColor: colors.White,
              child: SvgPicture.asset(IconConst.googleIcon),
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: h * 0.01,
          ),
          Center(
            child: Container(
              height: h * 0.25,
              width: w * 0.5,
              decoration: BoxDecoration(
                  color: colors.White,
                  borderRadius: BorderRadius.circular(w * 0.05),
                  boxShadow: [
                    BoxShadow(
                        color: colors.Black.withOpacity(.1),
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                        blurRadius: 5)
                  ],
                  image: const DecorationImage(
                    image: AssetImage(ImageConst.bigburger),
                  )),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          // Container(
          //   height: h * 0.06,
          //   width: w * 0.25,
          //   decoration: BoxDecoration(
          //       color: colors.Red,
          //       borderRadius: BorderRadius.circular(w * 0.07),
          //       gradient: const LinearGradient(
          //           colors: [Color(0xffF9881F), Color(0xffFF774C)],
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //           stops: [0.3, 0.7])),
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Icon(
          //         Icons.remove,
          //         color: colors.White,
          //       ),
          //       Text(
          //         "2",
          //         style: TextStyle(color: colors.White),
          //       ),
          //       Icon(
          //         Icons.add,
          //         color: colors.White,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: w * 0.07,
          ),
          Text(
            "Big boys Cheese burger",
            style: TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconConst.star),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text("4+")
                ],
              ),
              SizedBox(
                width: w * 0.05,
              ),
              Row(
                children: [
                  SvgPicture.asset(IconConst.thijj),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text("300cal")
                ],
              ),
              SizedBox(
                width: w * 0.05,
              ),
              Row(
                children: [
                  SvgPicture.asset(IconConst.clock),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text("5-10min")
                ],
              ),
            ],
          ),
          SizedBox(
            height: h * 0.03,
          ),
          Container(
              width: w * 0.88,
              child: Text(
                  "Our simple, classic cheeseburger begins with a 100% pure beef burger seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped")),
          SizedBox(
            height: h * 0.03,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Toppings for you",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SizedBox(height: h*0.025,),

          Padding(
            padding: const EdgeInsets.only(left:20),
            child: SizedBox(
              height: h*0.065,
              width: w*1,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex=index;
                      setState(() {

                      });
                    },
                    child: Container(
                      height: h * 0.055,
                      width: w * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * 0.07),
                        border: Border.all(width: w*0.005,color: selectedIndex==index?colors.PrimaryColour:colors.White),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: w*0.035,
                          ),
                          Text("Cheese")
                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.035,); }, itemCount: 4,

              ),
            ),
          ),
          SizedBox(
            height: h*0.03,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => YourCartPage(),));
            },
            child: Container(
              height: h*0.06,
              width: w*0.7,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(w*0.05),
                gradient: LinearGradient(colors: [colors.PrimaryColour,colors.Red.withOpacity(0.9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1,10.0]
                ),
              ),
              child: Center(child: Text("Add to cart",style: TextStyle(
                  color: colors.White
              ),)),
            ),
          )
        ],
      ),
    );
  }
}
