import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/auth/screen/edit_profile.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/feature/auth/screen/login_account.dart';
import 'package:food_app/feature/payment/screen/payment_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../main.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h*1,
     width: w*1,
     color: colors.Green.withOpacity(0.25),
      padding: EdgeInsets.only(top:w*0.14,left: w*0.05,bottom: w*0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: w*0.08,
                backgroundImage: NetworkImage(userImg.toString())
              ),
              SizedBox(width: w*0.03,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName??"",style: TextStyle(
                    fontSize: w*0.04,
                    fontWeight: FontWeight.w700
                  ),),
                  Text(userEmail??"",style: TextStyle(
                      fontSize: w*0.04,
                      fontWeight: FontWeight.w600
                  ),)
                ],
              ),
            ],
          ),

          SizedBox(
            height: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:
                  () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => EditProfile(),));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.account_circle,color: Colors.white,size: w*0.077,),
                      SizedBox(width: w*0.03,),
                      Text("My profile",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04
                      ),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => PaymentPage(),));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.payment,color: Colors.white,size: w*0.077,),
                      SizedBox(width: w*0.03,),
                      Text("Payment method",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04,
                      ),),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.help,color: Colors.white,size: w*0.077,),
                    SizedBox(width: w*0.03,),
                    Text("Settings",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.chat,color: Colors.white,size: w*0.077,),
                    SizedBox(width: w*0.03,),
                    Text("Help",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04
                    ),),
                  ],
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.09),
                        topRight: Radius.circular(w*0.09))
                ),

                builder: (context) {
                  return Container(
                    // color: Colors.red,
                    height: h*0.3,
                    child: Column(
                      children: [

                      Text("Logout Profile",
                      style: TextStyle(
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w600,
                          color: colors.Red
                      ),),
                    SizedBox(height: w*0.03,),
                    Divider(
                      endIndent: w*0.08,
                      indent: w*0.08,
                      thickness: w*0.003,
                    ),
                    Text("Are you sure you want to logout?",textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: w*0.04
                      ),),
                      SizedBox(height: h*0.04,),
                      Column(
                          children: [
                            InkWell(
                              onTap: () {
                                GoogleSignIn().signOut();
                                FirebaseAuth.instance.signOut();
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage( ),), (route) => false);
                              },
                              child: Container(
                                height: w*0.12,
                                width: w*0.6,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [0.3,0.7],
                                      colors:[
                                        Color(0xffF9881F),
                                        Color(0xffFF774C)
                                      ]),
                                  borderRadius: BorderRadius.circular(w*0.06),
                                ),

                                child: Center(child: Text("Yes, logout",style: TextStyle(
                                    color: colors.White,
                                  fontSize: w*0.04,
                                  fontWeight: FontWeight.w700
                                ),)),
                              ),
                            ),
                            SizedBox(height: w*0.03,),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: w*0.12,
                                width: w*0.6,
                                decoration: BoxDecoration(
                                  color: colors.Red,
                                  borderRadius: BorderRadius.circular(w*0.06),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [0.3,0.7],
                                      colors:[
                                        Color(0xffF9881F),
                                        Color(0xffFF774C)
                                      ]),
                                ),
                                child: Center(child: Text("Cancel",style: TextStyle(
                                    color: colors.White,
                                    fontSize: w*0.04,
                                    fontWeight: FontWeight.w700
                                ),)),
                              ),
                            ),
                  ]
                    )
                 ]) );

              },);
              GoogleSignIn().signOut();
              // FirebaseAuth.instance.signOut();
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage( ),), (route) => false);
            },
            child: Container(
              height: h*0.05,
              width: w*0.35,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w*0.04),
                color: colors.PrimaryColour,
              ),
              child: Center(child: Text("Logout",style: TextStyle(
                color: Colors.white,fontSize: w*0.04,fontWeight: FontWeight.w700
              ),))
            ),
          ),
        ],
      ),
    );
  }
}
