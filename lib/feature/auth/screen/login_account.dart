import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/auth/screen/forget_password.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/snack_bar_page.dart';
import 'package:food_app/feature/auth/controller/user_controller.dart';
import 'package:food_app/feature/auth/screen/create_account.dart';
import 'package:food_app/navigations/screen/bottom_navigation.dart';
import 'package:food_app/utube/homepage_utube.dart';
import 'package:image_picker/image_picker.dart';

import '../../../commons/icons.dart';
import '../../../main.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // addUser(){
  //   ref.read(usercontrollerprovider).userFunction(
  //       name: nameController.text,
  //       email: emailController.text,
  //       password: passwordController.text,
  //       image: imgUrl);
  // }
  GoogleAuth() {
    ref.read(usercontrollerprovider).googleFunction(context);
  }

  // getUser(email){
  //   ref.read(usercontrollerprovider).getFunction(email);
  //   if(emailController.text==email.toString()){
  //     showSnackBar(context, "successfully");
  //     Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));
  //   }else{
  //     showSnackBar(context, "please create account");
  //     Navigator.push(context, CupertinoPageRoute(builder: (context) => CreatePage(),));
  //
  //   }
  // }
  loginUser() {
    ref.watch(usercontrollerprovider).loginFun(emailController.text.trim(), passwordController.text.trim(), context);
  }
  // List data=[].

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          IconConst.splashIcon,
          height: w * 0.07,
          width: w * 0.07,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: h * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: w * 0.85,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Login to your account",
                        style: TextStyle(
                            fontSize: w * 0.07,
                            fontWeight: FontWeight.w800,
                            color: colors.Black),
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      Text(
                        "Good to see you again, enter your details below to continue ordering.",
                        style: TextStyle(
                            fontSize: w * 0.035,
                            fontWeight: FontWeight.w500,
                            color: colors.Black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.26,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.04),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w * 0.04,
                            color: colors.Black),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: w * 0.05),
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
                            padding: EdgeInsets.all(w * 0.023),
                          ),
                          constraints: BoxConstraints(
                              maxWidth: w * 0.9, maxHeight: w * 0.21),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.05)),
                          filled: true,
                          fillColor: colors.White,
                          labelText: "Enter email",
                          labelStyle: TextStyle(
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.w500,
                              color: colors.Grey),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colors.Grey2),
                              borderRadius: BorderRadius.circular(w * 0.05)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colors.Grey2),
                              borderRadius: BorderRadius.circular(w * 0.05))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.04),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w * 0.04,
                            color: colors.Black),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: w * 0.05),
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
                            padding: EdgeInsets.all(w * 0.023),
                          ),
                          constraints: BoxConstraints(
                              maxWidth: w * 0.9, maxHeight: w * 0.20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.05)),
                          filled: true,
                          fillColor: colors.White,
                          labelText: "Enter password",
                          labelStyle: TextStyle(
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.w500,
                              color: colors.Grey),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: colors.Grey2),
                              borderRadius: BorderRadius.circular(w * 0.05)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: colors.Grey2),
                              borderRadius: BorderRadius.circular(w * 0.05))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: w * 0.1,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoogleAuth();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.06),
                          color: colors.White),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10.0),
                        child: Wrap(
                          children: [
                            SvgPicture.asset(IconConst.googleIcon),
                            SizedBox(
                              width: w * 0.015,
                            ),
                            Text(
                              "Sign-in with Google",
                              style: TextStyle(
                                  fontSize: w * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: colors.Black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: w * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginUser();
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     CupertinoPageRoute(
                      //       builder: (context) => HomePageUtube(),
                      //     ),
                      //     (route) => false);
                    },
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.93,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 0.7],
                              colors: [Color(0xffF9881F), Color(0xffFF774C)]),
                          borderRadius: BorderRadius.circular(w * 0.06)),
                      child: Center(
                          child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w600,
                            color: colors.White),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: w * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const CreatePage(),));
                    },
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.93,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(w * 0.06)),
                      child: Center(
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                              fontSize: w * 0.045,
                              fontWeight: FontWeight.w600,
                              color: colors.Red),
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
