import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/model/user_model.dart';
import '../../../commons/icons.dart';
import '../../../main.dart';
import '../controller/user_controller.dart';
import 'login_account.dart';

class CreatePage extends ConsumerStatefulWidget {
  UserModel? userModel;
  final bool google;
  CreatePage({super.key,this.userModel,required this.google});

  @override
  ConsumerState<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends ConsumerState<CreatePage> {

  String imgUrl=("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKc6EnanoKKj61vCCamKeDwXelxNzUElzIWWDgf75XNEa1-uaHgiSq32hF7bp73Tq9nsY&usqp=CAU");


  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  addUser(){
    ref.read(usercontrollerprovider).userFunction(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        image: imgUrl,
        id: widget.userModel?.id,
        cart: [],
        status: false
    );
  }


  GoogleAuth(){
    ref.read(usercontrollerprovider).googleFunction(context);
  }


  // googleNewUserScreen(){
  //   ref.read(usercontrollerprovider).googleNewUserController(nameController.text, emailController.text, passwordController.text, widget.userModel?.image.toString(),widget.userModel!.id);
  // }
  bool pick=false;

 String profileImage="";

  @override
  void initState() {
    if(widget.google==true){
      emailController = TextEditingController(text: widget.userModel?.email);
      imgUrl=widget.userModel!.image.toString();
      nameController.text = widget.userModel!.name;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.Background,
        title: SvgPicture.asset(IconConst.splashIcon,height: w*0.07,width: w*0.07,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: h*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left:w*0.06,right: w*0.06),
                  child: SizedBox(
                    // color: Colors.blue,
                    width: w*0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Create an account",
                          style: TextStyle(
                              fontSize: w*0.07,
                              fontWeight: FontWeight.w800,
                              color: colors.Black
                          ),
                        ),
                        SizedBox(height: h*0.015,),
                        Text("Welcome friend, enter your details so lets get started in ordering food.",
                          style: TextStyle(
                              fontSize: w*0.035,
                              fontWeight: FontWeight.w500,
                              color: colors.Black
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h*0.5,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // google==true ?
                    CircleAvatar(
                      radius: w*0.15,
                      backgroundImage: NetworkImage(imgUrl),
                    ),
                    //     :
                    // CircleAvatar(
                    //   radius: w*0.15,
                    //   backgroundImage: NetworkImage(profileImage),
                    // ),
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
                      readOnly: widget.google,
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
                              maxHeight: w*0.21
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.05)
                          ),
                          filled: true,
                          fillColor: colors.White,
                          labelText: "Password",
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
              Center(
                child: Column(
                  children: [
                    // Center(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       GoogleAuth();
                    //     },
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(w*0.06),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.fromLTRB(20,10,20,10.0),
                    //         child: Wrap(
                    //           // mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             SvgPicture.asset(IconConst.googleIcon),
                    //             SizedBox(width: w*0.015,),
                    //             Text("Sign-in with Google",
                    //               style: TextStyle(
                    //                 fontSize: w*0.045,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: colors.Black
                    //               ),)
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: w*0.05,),
                    GestureDetector(
                      onTap: () {
                        addUser();
                        Navigator.push(context, CupertinoDialogRoute(builder: (context) => const LoginPage(), context: context));
                      },
                      child: Container(
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
                            child: Text("Sign up",
                              style: TextStyle(
                                  fontSize: w*0.045,
                                  fontWeight: FontWeight.w600,
                                  color: colors.White
                              ),)),
                      ),
                    ),
                    SizedBox(height: w*0.05,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage(),));
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
