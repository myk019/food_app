import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordController2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Community,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.Community,
        title: SvgPicture.asset(IconConst.SplashIcon,height: w*0.07,width: w*0.07,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: h*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: w*0.23,
                  width: w*0.8,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Create an account",
                        style: TextStyle(
                            fontSize: w*0.076,
                            fontWeight: FontWeight.w800,
                            color: colors.Black
                        ),
                      ),
                      Text("Welcome friend, enter your details so lets get\nstarted in ordering food.",
                        style: TextStyle(
                            fontSize: w*0.04,
                            fontWeight: FontWeight.w500,
                            color: colors.Black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: h*0.4,
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
                    Padding(
                      padding:  EdgeInsets.only(left: w*0.04),
                      child: Text("Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.042,
                            color: colors.Black
                        ),),
                    ),
                    TextFormField(
                      controller: passwordController,
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
                              maxHeight: w*0.20
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          filled: true,
                          fillColor: colors.White,
                          labelText: "Enter password",

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
                    Padding(
                      padding:  EdgeInsets.only(left: w*0.04),
                      child: Text("Confirm Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.042,
                            color: colors.Black
                        ),),
                    ),
                    TextFormField(
                      controller: passwordController2,
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
                          labelText: "Confirm password",
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
              Column(
                children: [
                  Container(
                    height: h*0.062,
                    width: w*0.56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.06),
                      color: colors.White
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(IconConst.GoogleIcon),
                        Text("Sign-in with Google",
                          style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w600,
                            color: colors.Black
                          ),)
                      ],
                    ),
                  ),
                  SizedBox(height: w*0.05,),
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
                      child: Text("Login to my account",
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
            ],
          ),
        ),
      ),
    );
  }
}
