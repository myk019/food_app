import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(IconConst.SplashIcon,height: w*0.07,width: w*0.07,),
        centerTitle: true,
      ),
    );
  }
}
