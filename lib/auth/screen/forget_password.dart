import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/auth/screen/reset_password.dart';
import 'package:food_app/commons/colours.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class ForgetPAssword extends StatefulWidget {
  const ForgetPAssword({super.key});

  @override
  State<ForgetPAssword> createState() => _ForgetPAsswordState();
}

class _ForgetPAsswordState extends State<ForgetPAssword> {

  TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.Background,
        title: SvgPicture.asset(IconConst.SplashIcon,height: w*0.07,width: w*0.07,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: h*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: w*0.23,
                  width: w*0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text("Forgot password",
                          style: TextStyle(
                              fontSize: w*0.07,
                              fontWeight: FontWeight.w800,
                              color: colors.Black
                          ),
                        ),
                      ),
                      Center(
                        child: Text("Enter your email address to request a\npassword reset.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w500,
                              color: colors.Black
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h*0.15,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: w*0.04),
                      child: Text("Email Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.042,
                            color: colors.Black
                        ),),
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w*0.05
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if(
                      //   !emailValidation.hasMatch(value!)
                      //   ){
                      //     return ("Enter valid email");
                      //   }else{
                      //     return null;
                      //   }
                      // },
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(w*0.023),
                          ),
                          constraints: BoxConstraints(
                              maxWidth: w*0.9,
                              maxHeight: w*0.21
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          filled: true,
                          fillColor: colors.White,
                          labelText: "Enter email",
                          labelStyle: TextStyle(
                              fontSize: w*0.05,
                              fontWeight:FontWeight.w500,
                              color: colors.Grey
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colors.Grey2
                              ),
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colors.Grey2
                              ),
                              borderRadius: BorderRadius.circular(w*0.05)
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: w*0.05,),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, CupertinoDialogRoute(builder: (context) => ResetPassword(), context: context));
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
                          child: Text("Confirm",
                            style: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w600,
                                color: colors.White
                            ),)),
                    ),
                  ),
                  SizedBox(height: w*0.05,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
