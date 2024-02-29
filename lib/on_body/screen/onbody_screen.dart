import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/commons/images.dart';
import 'package:food_app/on_body/screen/onbody_content.dart';

import '../../main.dart';

class OnBodyScreen extends StatefulWidget {
  const OnBodyScreen({super.key});

  @override
  State<OnBodyScreen> createState() => _OnBodyScreenState();
}

class _OnBodyScreenState extends State<OnBodyScreen> {

  int onPageIndex=0;
  PageController onPageController= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: SvgPicture.asset(IconConst.SplashIcon,height: w*0.1,width: w*0.1,),
        centerTitle: true,
      ),
      body: PageView.builder(
        padEnds: false,
        itemCount: contents.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(
              contents[index].text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: w*0.07
              ),),
            Container(
              height: w*0.8,
              width: w*1,
              child: Image(image: AssetImage(ImageConst.onBodyImg1)),
              ),
          ],
        );
      },
      ),
    );
  }
}
