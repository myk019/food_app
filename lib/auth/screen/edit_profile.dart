import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';

import '../../commons/icons.dart';
import '../../main.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController nameController=TextEditingController();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Update your profile",
            style: TextStyle(
                fontSize: w*0.07,
                fontWeight: FontWeight.w800,
                color: colors.Black
            ),
          ),
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: h*0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: w*0.15,
                      backgroundColor: colors.PrimaryColour,
                      child: Icon(Icons.image_outlined,color: colors.White,size: w*0.1),
                    ),
                    TextFormField(
                      controller: nameController,
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
                          labelText: "User name",
                          labelStyle: TextStyle(
                              fontSize: w*0.04,
                              fontWeight:FontWeight.w500,
                              color: colors.Grey
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: colors.Grey2
                              ),
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: colors.Grey2
                              ),
                              borderRadius: BorderRadius.circular(w*0.05)
                          )
                      ),
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
                              maxHeight: w*0.20
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          filled: true,
                          fillColor: colors.White,
                          labelText: "Enter email",

                          labelStyle: TextStyle(
                              fontSize: w*0.04,
                              fontWeight:FontWeight.w500,
                              color: colors.Grey
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: colors.Grey2
                              ),
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: colors.Grey2
                              ),
                              borderRadius: BorderRadius.circular(w*0.05)
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: h*0.065,
            width: w*0.93,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
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
                child: Text("Update",
                  style: TextStyle(
                      fontSize: w*0.045,
                      fontWeight: FontWeight.w600,
                      color: colors.White
                  ),)),
          ),
        ],
      ),
    );
  }
}
