import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/feature/auth/screen/login_account.dart';
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
    print("88888888888888888888888888888888888azexsvfgbyzesxrcdtvfygb88888888888888888888888888888888888888888888");
    print(userName);
    print(userEmail);
    print(userId);
    print(userImg);
    var cuData=await FirebaseFirestore.instance.collection("Users").doc(userId).get();
    if(!cuData.exists){
      Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) =>LoginPage(),)));
    }
    else{
      currentUserModel=UserModel.fromMap(cuData.data()!);
      print(cuData);
      print("-------------------------------------88888888888888");
      userName=currentUserModel!.name??'';
      currentUserModel=UserModel(name: userName, email: userEmail!, password: "", image: userImg, cart: [], id: userId!);
      print(currentUserModel);
      print("8888888888888888888888888888888888888888888888888888888888888888888888888888888");
      // getname();
      Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),)));
    }



  }
  getname() async {
    print(currentUserModel);
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

    setState(() {
    });
  }

  @override
  void initState() {
    getData();
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
