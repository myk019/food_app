import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/main.dart';
import 'package:food_app/model/user_model.dart';
import 'package:food_app/on_body/screen/onbord_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utube/homepage_utube.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // String? UserName;
  getData() async {

    SharedPreferences _prefs=await SharedPreferences.getInstance();
    userEmail=_prefs.getString("email");
    userName=_prefs.getString("name");
    userImg=_prefs.getString("image");
    userId=_prefs.getString("id");
    print("8888888888888888888888888888888888888888888888888888888888888888888888888888888");
    print(userName);
    print(userEmail);
    print(userId);
    print(userImg);
    print("8888888888888888888888888888888888888888888888888888888888888888888888888888888");

    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),)));


  }
  getname() async {
    print(userId);
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    var cuData=await FirebaseFirestore.instance.collection("Users").doc(userId).get();
    currentUserModel=UserModel.fromMap(cuData.data()!);
    userName=currentUserModel!.name??'';
    setState(() {
    });
  }

  @override
  void initState() {
    getData();
    getname();
    // TODO: implement initState
    // Future.delayed(const Duration(seconds: 4))
    //     .then((value) => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const OnBodyScreen(),
    //         )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(IconConst.splashIcon))],
      ),
    );
  }
}
