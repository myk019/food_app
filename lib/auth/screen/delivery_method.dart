import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class DeliveryMethod extends StatefulWidget {
  const DeliveryMethod({super.key});

  @override
  State<DeliveryMethod> createState() => _DeliveryMethodState();
}

class _DeliveryMethodState extends State<DeliveryMethod> {

  var payment=[
    "assets/icons/mastercard.svg",
    "assets/icons/paypal.svg",
    "assets/icons/stripe.svg"
  ];
  int selectIndex=0;
  bool tick=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: h*0.8,
          child: Padding(
            padding: EdgeInsets.only(left: w*0.02,right: w*0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h*0.05,
                  width: w*0.92,
                  child: Text("Delivery method",style: TextStyle(
                      fontSize: w * 0.07,
                      fontWeight: FontWeight.w800,
                      color: colors.Black
                  ),),
                ),
                SizedBox(
                  width: w*0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w*0.5,
                          // color: Colors.blue,
                          child: const Text("137 Teaticket Hwy, East Falmouth MA 2536",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colors.Black
                          ),)),
                      SizedBox(
                        height: h*0.05,
                        // color: Colors.yellowAccent,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Change",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: colors.Red2
                              // fontSize: w*0.02
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: w*0.92,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("+234 9011039271",
                        style: TextStyle(
                        fontWeight: FontWeight.w500,
                          color: colors.Black
                      ),),
                      Text("Change",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: colors.Red2
                        // fontSize: w*0.02
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: h*0.02,),
                SizedBox(
                  width: w*0.92,
                  child: Text("Payment",style: TextStyle(
                      fontSize: w * 0.07,
                      fontWeight: FontWeight.w800,
                      color: colors.Black
                  ),),
                ),
                SizedBox(
                  width: w*0.92,
                  child: Row(
                    children: [
                      SizedBox(
                        height: h*0.07,
                        width: w*0.15,
                        child: SvgPicture.asset(IconConst.addMore),
                      ),
                      SizedBox(width: w*0.05,),
                      SizedBox(
                        height: h*0.07,
                        child: ListView.separated(
                          itemCount: payment.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                selectIndex=index;
                                setState(() {

                                });
                              },
                              child: Container(
                                width: w*0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w*0.05),
                                  color: colors.White,
                                  border: Border.all(
                                    width: w*0.005,
                                    color: selectIndex==index?colors.PrimaryColour:Colors.transparent
                                  )
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(w*0.02),
                                  child: SvgPicture.asset(payment[index]),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return  SizedBox(width: w*0.03,);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: h*0.05,
                  width: w*0.8,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(w*0.05),
                    color: colors.White
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        side:const BorderSide(color: colors.Black),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w*0.05)),
                        value: tick,
                        activeColor: colors.PrimaryColour,
                        onChanged: (value) {
                          setState(() {
                            tick=!tick;
                          });
                        },),
                      const Text("Pay on arrival",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontSize: w*0.045,
                          color: colors.Black
                        ),)
                    ],
                  ),
                ),
                SizedBox(
                  width: w*0.92,
                  child: Text("Pay with cash/POS upon arrival ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: w*0.03,
                    color: colors.Red
                  ),),
                ),
                SizedBox(height: h*0.02,),
                SizedBox(
                  height: h*0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: w*0.92,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Fee",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: colors.Black
                              ),),
                            Text("20",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: colors.Black
                              ),)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w*0.92,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: colors.Black
                              ),),
                            Text("520",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: colors.Black
                              ),)
                          ],
                        ),
                      ),
                      Divider(
                        indent: w*0.02,
                        endIndent: w*0.02,
                        height: w*0.04,
                        thickness: w*0.002,
                        color: colors.Black,
                      ),
                      SizedBox(
                        width: w*0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colors.Black
                            ),),
                            Text("540",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: colors.Black,
                                fontSize: w*0.055
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: w*0.02),
        child: Container(
          height: h*0.065,
          width: w*0.93,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
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
              child: Text("Proceed to Payment",
                style: TextStyle(
                    fontSize: w*0.045,
                    fontWeight: FontWeight.w600,
                    color: colors.White
                ),)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
