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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(IconConst.SplashIcon,height: w*0.07,width: w*0.07,),
        centerTitle: true,
      ),
      body: Column(
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
                        fontSize: w*0.08,
                        fontWeight: FontWeight.w800,
                        color: colors.Black
                    ),
                  ),
                  Text("Welcome friend, enter your details so lets get\nstarted in ordering food.",
                    style: TextStyle(
                        fontSize: w*0.04,
                        fontWeight: FontWeight.w800,
                        color: colors.Black
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
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
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    filled: true,
                    labelText: "Valid email",
                    labelStyle: TextStyle(
                        fontSize: w*0.05,
                        fontWeight:FontWeight.w500,
                        color: colors.Black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: colors.Grey
                        ),
                        borderRadius: BorderRadius.circular(w*0.03)
                    )
                ),
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: w*0.05
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if(
                //   !passwordValidation.hasMatch(value!)
                //   ){
                //     return ("Enter valid password");
                //   }else{
                //     return null;
                //   }
                // },
                decoration: InputDecoration(
                    constraints: BoxConstraints(
                        maxWidth: w*0.9,
                        maxHeight: w*0.21
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(w*0.02),
                    ),
                    filled: true,
                    labelText: "password",
                    labelStyle: TextStyle(
                        fontSize: w*0.05,
                        fontWeight:FontWeight.w500,
                        color: colors.Black
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: colors.Grey
                        ),
                        borderRadius: BorderRadius.circular(w*0.03)
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
