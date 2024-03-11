import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  ///Controllers

  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController cvvController=TextEditingController();
  GestureFlipCardController flipCardController=GestureFlipCardController();

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
        child: Container(
          padding: EdgeInsets.only(left: w*0.03,right: w*0.03),
          height: h*0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureFlipCard(
                      frontWidget: Container(
                        padding: EdgeInsets.all(w*0.04),
                        height: w*0.6,
                        width: w*1,
                        decoration: BoxDecoration(
                            image: const DecorationImage(image: AssetImage(ImageConst.card),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(w*0.05)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: w*0.05,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Balance",style: GoogleFonts.sourceSans3(
                                        fontWeight: FontWeight.w400,
                                        color: colors.White,
                                        fontSize: w*0.045
                                    ),),
                                    Text("\$1299.15",style: GoogleFonts.sourceSans3(
                                        fontWeight: FontWeight.w400,
                                        color: colors.White,
                                        fontSize: w*0.09
                                    ),),
                                  ],
                                ),
                                SvgPicture.asset(IconConst.masterCard,height: w*0.15,width: w*0.15,)
                              ],
                            ),
                            SizedBox(height: w*0.05,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: w*0.05,),
                                    Text(dateController.text,style: TextStyle(
                                        color: colors.White,
                                        fontWeight: FontWeight.w700,
                                        fontSize: w*0.06
                                    ),),
                                    SizedBox(height: w*0.02,),
                                    Text(numberController.text,style: TextStyle(
                                        fontSize: w*0.05,
                                        fontWeight: FontWeight.w700,
                                        color: colors.White
                                    ),)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      backWidget: Container(
                        height: w*0.6,
                        width: w*1,
                        padding: EdgeInsets.only(top: w*0.05),
                        decoration: BoxDecoration(
                            image: const DecorationImage(image: AssetImage(ImageConst.card),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(w*0.05)
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: w*0.15,
                              width: w*1,
                              color: colors.Black,
                            ),
                            SizedBox(height: w*0.09,),
                            Row(
                              children: [
                                Container(
                                  height: w*0.09,
                                  width: w*0.6,
                                  color: colors.White,
                                ),
                                Container(
                                  height: w*0.07,
                                  width: w*0.09,
                                  color: colors.White,
                                  child: Center(child: Text(cvvController.text)),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: h*0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "full name",
                            labelStyle: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w500,
                            ),
                            // hintText: "please enter your name",
                            hintStyle: TextStyle(
                                color: colors.Grey,
                                fontWeight: FontWeight.w500,
                                fontSize: w*0.05
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color:colors.Grey,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: numberController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w700,
                          ),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            filled: true,
                            labelText: " card number",
                            labelStyle: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w400,
                            ),
                            // hintText: "please enter your number",
                            hintStyle: TextStyle(
                                color: colors.Grey,
                                fontWeight: FontWeight.w700,
                                fontSize: w*0.05
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color:colors.Grey2,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: const BorderSide(
                                    color: colors.Grey2
                                )
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              numberController.text=value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: w*0.14,
                              width:w*0.43,
                              child: TextFormField(
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(
                                  fontSize: w*0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: "date",
                                  labelStyle: TextStyle(
                                    fontSize: w*0.05,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: "MM/YYYY",
                                  hintStyle: TextStyle(
                                      color: colors.Grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: w*0.05
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color:colors.Grey2,
                                      ),
                                      borderRadius: BorderRadius.circular(w*0.03)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: colors.Grey2,
                                      ),
                                      borderRadius: BorderRadius.circular(w*0.03)
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    dateController.text=value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: w*0.14,
                              width: w*0.43,
                              child: TextFormField(
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                maxLength: 3,
                                style: TextStyle(
                                  fontSize: w*0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  labelText: "cvv",
                                  labelStyle: TextStyle(
                                    fontSize: w*0.05,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  // hintText: "please enter your name",
                                  hintStyle: TextStyle(
                                      color: colors.Grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: w*0.05
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color:colors.Grey2,
                                      ),
                                      borderRadius: BorderRadius.circular(w*0.03)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(w*0.03)
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    cvvController.text=value;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                backgroundColor: colors.White,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(w*0.05)
                ),
                content: Container(
                  height: w*1.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Lottie.asset(ImageConst.lottie),
                      Text("Payment Successfull!",style: TextStyle(
                          fontSize: w*0.06,
                          fontWeight: FontWeight.w700,
                          color: colors.PrimaryColour
                      ),),
                      Text("Successfully made payment and hotel booking",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.055,
                            color: colors.Black
                        ),),
                      Center(
                        child: InkWell(
                          onTap: () {
                          },
                          child: Container(
                            child: Center(
                              child: Text("View Ticket",
                                style: TextStyle(
                                    fontSize: w*0.052,
                                    fontWeight: FontWeight.w600,
                                    color: colors.White
                                ),),
                            ),
                            height: w*0.15,
                            width: w*0.85,
                            decoration: BoxDecoration(
                              color: colors.PrimaryColour,
                              borderRadius: BorderRadius.circular(w*0.1),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Center(
                              child: Text("Cancel",
                                style: TextStyle(
                                    fontSize: w*0.052,
                                    fontWeight: FontWeight.w600,
                                    color: colors.PrimaryColour
                                ),),
                            ),
                            height: w*0.15,
                            width: w*0.85,
                            decoration: BoxDecoration(
                              color: colors.White,
                              borderRadius: BorderRadius.circular(w*0.1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },);
        },
        child: Padding(
          padding:  EdgeInsets.only(bottom: w*0.02),
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
                child: Text("Pay now",
                  style: TextStyle(
                      fontSize: w*0.045,
                      fontWeight: FontWeight.w600,
                      color: colors.White
                  ),)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
