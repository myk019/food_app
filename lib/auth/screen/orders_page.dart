import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:super_banners/super_banners.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var items = [
    {
      "image": "assets/icons/google.svg",
      "title": "The Macdonalds",
      "sub title": "The Macdonalds",
      "rate": "23.99",
    },
    {
      "image": "assets/icons/google.svg",
      "title": "The Macdonalds",
      "sub title": "The Macdonalds",
      "rate": "23.99",
    },
    {
      "image": "assets/icons/google.svg",
      "title": "The Macdonalds",
      "sub title": "The Macdonalds",
      "rate": "23.99",
    },
    {
      "image": "assets/icons/google.svg",
      "title": "The Macdonalds",
      "sub title": "The Macdonalds",
      "rate": "23.99",
    },
    {
      "image": "assets/icons/google.svg",
      "title": "The Macdonalds",
      "sub title": "The Macdonalds",
      "rate": "23.99",
    },
    {
      "image": "assets/icons/google.svg",
      "title": "The Macdonalds",
      "sub title": "The Macdonalds",
      "rate": "23.99",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: colors.Background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              IconConst.leftArrow,
              height: h * 0.03,
              width: w * 0.06,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: w * 0.03),
              child: Text(
                "Your orders",
                style: TextStyle(
                    fontSize: w * 0.07,
                    fontWeight: FontWeight.w800,
                    color: colors.Black),
              ),
            ),
            SizedBox(
              height: 60,
              width: w,
              child: const TabBar(
                labelColor: colors.Black,
                indicatorColor: colors.Black,
                indicatorSize: TabBarIndicatorSize.label,
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                tabs: [
                  Tab(
                    text: "Complete orders",
                  ),
                  Tab(
                    text: "Pending orders",
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.75,
              width: w * 1,
              color: Colors.transparent,
              child: TabBarView(
                  children: [

                    /// Complete Orders

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: h * 0.13,
                                    width: w * 0.93,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(w * 0.03)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: h * 0.07,
                                          width: w * 0.2,
                                          decoration: BoxDecoration(
                                              // color: Colors.blue,
                                              borderRadius:
                                              BorderRadius.circular(w * 0.04)),
                                          child: SvgPicture.asset(IconConst.star),
                                        ),
                                        Container(
                                          height: h * 0.1,
                                          // color: Colors.blue,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "The Macdonalds",
                                                style: TextStyle(
                                                    fontSize: w * 0.042,
                                                    fontWeight: FontWeight.w700,
                                                    color: colors.Black),
                                              ),
                                              Text(
                                                "Classic cheesburger",
                                                style: TextStyle(
                                                    fontSize: w * 0.04,
                                                    fontWeight: FontWeight.w500,
                                                    color: colors.Black),
                                              ),
                                              Text(
                                                "23.99",
                                                style: TextStyle(
                                                    fontSize: w * 0.04,
                                                    fontWeight: FontWeight.w600,
                                                    color: colors.Red),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: h * 0.12,
                                          width: w * 0.25,
                                          // color: Colors.blue,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  CircleAvatar(
                                                    radius: w * 0.04,
                                                    backgroundColor: colors.PrimaryColour,
                                                    child: Icon(Icons.remove,color: colors.White,),
                                                  ),
                                                  Text("1"),
                                                  CircleAvatar(
                                                    radius: w * 0.04,
                                                    backgroundColor: colors.PrimaryColour,
                                                    child: Icon(Icons.add,color: colors.White,),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: h * 0.02,
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  "Order again",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: w * 0.04,
                                                      color: colors.Red),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: w*0.01,)
                                      ],
                                    ),
                                  ),
                                ),
                                /// Corner Banner
                                Positioned(
                                  right: w*0.034,
                                  // left: w*0.07,
                                  child: CornerBanner(
                                    bannerPosition: CornerBannerPosition.topRight,
                                    bannerColor: colors.Green2,
                                    child: Text("Completed",
                                      style: TextStyle(
                                          color: colors.White,
                                          fontSize: w*0.03
                                      ),),
                                  ),
                                )
                              ]);
                        }, separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height:w*0.02);
                      },
                      ),
                    )
                  ],
                ),

                /// Pending Orders

                Column(
                  children: [
                    Text('data'),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
