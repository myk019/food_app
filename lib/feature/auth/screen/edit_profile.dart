import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/feature/auth/controller/user_controller.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/model/user_model.dart';
import 'package:food_app/utube/homepage_utube.dart';

import '../../../commons/icons.dart';
import '../../../main.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}


class _EditProfileState extends ConsumerState<EditProfile> {

  bool coverImg=false;

  TextEditingController nameController = TextEditingController(text: userName);
  TextEditingController emailController = TextEditingController(text: userEmail);

  userUpdateSc() async {
    var data=await FirebaseFirestore.instance.collection("Users").doc(userId).get();
    currentUserModel=UserModel.fromMap(data.data()!);
    ref.read(usercontrollerprovider).userUpdateCo(currentUserModel!.copyWith(
        name: nameController.text, email: emailController.text.trim(), image: coverImage
    ));
    userName=nameController.text;

    setState(() {
    });
  }

  // currentUserModelUpdate(){
  //   ref.read(usercontrollerprovider).currentUserModelUpdate();
  // }

  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? coverImage;
  bool value = false;

  Future selectFileToMessage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    pickFile = result.files.first;

    // String? ext = pickFile?.name?.split('.')?.last;
    final fileBytes = result.files.first.bytes;

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Loading......")));
    uploadFileToFireBase(name, fileBytes);

    setState(() {});
  }

  Future uploadFileToFireBase(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('Categories/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    coverImage = (await snapshot?.ref.getDownloadURL())!;

    // ignore: use_build_context_synchronously
    // showUploadMessage(context, '$name Uploaded Successfully...');
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.Background,
        title: SvgPicture.asset(
          IconConst.splashIcon,
          height: w * 0.07,
          width: w * 0.07,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Update your profile",
            style: TextStyle(
                fontSize: w * 0.07,
                fontWeight: FontWeight.w800,
                color: colors.Black),
          ),
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: h * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectFileToMessage("user");
                        coverImg=true;
                      },
                      child: CircleAvatar(
                        radius: w * 0.15,
                        backgroundImage: NetworkImage(coverImg?coverImage.toString():userImg),
                      ),
                    ),
                    TextFormField(
                      controller: nameController,
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
                          labelText: "User name",
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
                      readOnly: true,
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
                          labelText: "Enter email",
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
            ),
          ),
          GestureDetector(
            onTap: () {
              userUpdateSc();
              // currentUserModelUpdate();
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));
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
                "Update",
                style: TextStyle(
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.w600,
                    color: colors.White),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
