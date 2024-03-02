import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
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
