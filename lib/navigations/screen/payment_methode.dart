import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flml_internet_checker/flml_internet_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/navigations/screen/bottom_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:food_app/commons/lottie.dart';
// import 'package:luna_demo/commons/color%20constansts.dart';
// import 'package:luna_demo/commons/image%20Constants.dart';
// import 'package:luna_demo/features/bookings/screens/review_page.dart';
// import 'package:luna_demo/features/home/screen/navbar.dart';
// import 'package:luna_demo/model/booking_address_model.dart';

// import '../../../commons/seachParam.dart';
// import '../../../commons/widgets.dart';
import '../../../main.dart';
import '../../commons/icons.dart';
import '../../model/booking_address_model.dart';
// import '../controller/booking_controller.dart';


class paymentMethod extends ConsumerStatefulWidget {
  paymentMethod({super.key});
  // BookingModel bookingModel1;

  @override
  ConsumerState<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends ConsumerState<paymentMethod> {
  String cont="COD";
  // add(){
  //   BookingModel bookingdata=widget.bookingModel1.copyWith(
  //       paymentMethod: cont,
  //       search: setSearchParam(widget.bookingModel1.productName)
  //
  //   );
  //   ref.watch(addBookingProvider(bookingdata));
  //
  // }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: colors.Background,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8,bottom: 4),
              child: Container(
                height: h*0.07,
                width: w*0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),

                    border: Border.all(  color: colors.lightgrey,
                    )
                ),

                child: Center(
                  child: SvgPicture.asset(
                    IconConst.leftArrow,
                  ),
                ),
              ),
            )
        ),
        title: Column(
          children: [
            InkWell(
              onTap: () {
                // _determinePosition();

              },
              child: Text(
                "Delivery to",
                style: TextStyle(color: colors.Black, fontSize: w * 0.03),
              ),
            ),
            Text(""
              // _currentAdress.isNotEmpty?_currentAdress:("Location"),

              // _position != null?("Current Location"+_position.toString()):("no Location data"),
              // style: TextStyle(color: colors.Red, fontSize: w * 0.03),
            ),
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
              backgroundImage: NetworkImage(userImg)  ,
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: w*1,
                height: h*0.35,
               //color: colors.Red,
                child: Lottie.asset(lottieConst.payment22)
              ),
              Column(
                children: [
                  Container(
                    width: w*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.03),
                        border: Border.all(color: colors.PrimaryColour)
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text("Google Pay",style: TextStyle(color: CupertinoColors.black,),),
                        trailing:Radio(
                          activeColor: colors.PrimaryColour,
                          fillColor: MaterialStatePropertyAll(colors.PrimaryColour),
                          value: "G",
                          groupValue: cont,
                          onChanged: (value) {

                          },
                        ) ,
                      ),
                    ),
                  ),
                  SizedBox(height: h*0.02,),
                  Container(
                    width: w*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.03),
                        border: Border.all(color: colors.PrimaryColour)
                    ),
                    child: ListTile(
                      title: Text("Credit/Debit",style: TextStyle(color: CupertinoColors.black,),),
                      trailing:Radio(
                        activeColor: colors.PrimaryColour,
                        fillColor: MaterialStatePropertyAll(colors.PrimaryColour),
                        value: "C",
                        groupValue: cont,
                        onChanged: (value) {

                        },
                      ) ,
                    ),
                  ),
                  SizedBox(height: h*0.02,),
                  Container(
                    width: w*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.03),
                        border: Border.all(color: colors.PrimaryColour)
                    ),
                    child: ListTile(
                      title: Text("COD",style: TextStyle(color: CupertinoColors.black,),),
                      trailing:Radio(
                        activeColor: colors.PrimaryColour,
                        fillColor: MaterialStatePropertyAll(colors.PrimaryColour),
                        value: "COD",
                        groupValue: cont,
                        onChanged: (value) {
                          setState(() {
                            cont=value!;
                          });
                        },
                      ) ,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {

                  // await  add();
                  setState(() {

                  });
                  // bookingdata();
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          surfaceTintColor: colors.Red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          content: Container(
                            height: h*0.5,
                            width: w*1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child: Column(
                              children: [
                                Lottie.asset(lottieConst.Success),
                                Text("Successfully Ordered!!",style: TextStyle(fontSize: w*0.045),),

                                // gap,
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //   children: [
                                //     ElevatedButton(onPressed: () {
                                //       Navigator.push(context, CupertinoPageRoute(builder:
                                //           (context) => reviewPage(id: widget.id,),));
                                //     }, child: Text("Give a Review",style: TextStyle(color: Pallette.white),),
                                //     style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Pallette.primaryColor)),
                                //     ),
                                //     ElevatedButton(onPressed: () {
                                //       Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => NavBar(),));
                                //     }, child: Text("Ok",style: TextStyle(color: Pallette.white),),
                                //       style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Pallette.primaryColor)
                                //       )
                                //     )
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        );
                      }
                  );
                  Future.delayed(Duration(seconds: 2))
                      .then((value) => Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder:
                      (context) => NavigationPage(bottomIndex: 0,),), (route) => false));


                },
                child: Container(
                  height: h*0.06,
                  width: w*0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.3),
                      color:colors.PrimaryColour
                  ),
                  child: Center(
                    child: Text("Continue",style: TextStyle(
                        color: colors.White,
                        fontSize: w*0.04,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}