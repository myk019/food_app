import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/commons/colours.dart';

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
     color: colors.PrimaryColour.withOpacity(0.25),
      padding: EdgeInsets.only(top:w*0.14,left: w*0.05,bottom: w*0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: w*0.08,
              ),
              SizedBox(width: w*0.03,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",style: TextStyle(
                    fontSize: w*0.04,
                    fontWeight: FontWeight.w700
                  ),),
                  Text("Bio",style: TextStyle(
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
                Row(
                  children: [
                    Icon(Icons.account_circle,color: Colors.white,size: w*0.077,),
                    SizedBox(width: w*0.03,),
                    Text("Account",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.privacy_tip,color: Colors.white,size: w*0.077,),
                    SizedBox(width: w*0.03,),
                    Text("Privacy",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.help,color: Colors.white,size: w*0.077,),
                    SizedBox(width: w*0.03,),
                    Text("Help",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.chat,color: Colors.white,size: w*0.077,),
                    SizedBox(width: w*0.03,),
                    Text("Chat",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w600,fontSize: w*0.04
                    ),),
                  ],
                ),
              ],
            ),
          ),

          Container(
            height: h*0.05,
            width: w*0.35,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w*0.04),
              color: colors.PrimaryColour,
            ),
            child: Center(child: Text("Logout",style: TextStyle(
              color: Colors.white,fontSize: w*0.04,fontWeight: FontWeight.w700
            ),))
          )
        ],
      ),
    );
  }
}
