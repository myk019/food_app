
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/core/providers/firebase_provider.dart';
import 'package:food_app/main.dart';
import 'package:food_app/model/user_model.dart';
import 'package:food_app/navigations/screen/bottom_navigation.dart';
import 'package:food_app/utube/homepage_utube.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../screen/create_account.dart';

final authrepositoryprovider = Provider((ref) => Authrepository(auth: ref.watch(authprovider), firestore: ref.watch(firestoreprovider)));

class Authrepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  // final FirebaseStorage _firebaseStorage;
  Authrepository(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;
  // _firebaseStorage=firebaseStorage;

  CollectionReference get _authuser => _firestore.collection("Users");

  // String imageurl = "";


  signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await _auth.signInWithCredential(credential);

    late UserModel userData;

    if (userCredential.additionalUserInfo!.isNewUser) {
      userData = UserModel(
          name: userCredential.user!.displayName.toString(),
          email: userCredential.user!.email.toString(),
          password: "",
          image: userCredential.user!.photoURL.toString());

      await _authuser.doc(userCredential.user!.email!).set(userData.toMap());
    }else{
      User? user=userCredential.user;
      useName=user?.displayName.toString();
      userEmail=user?.email.toString();

      SharedPreferences _prefs= await SharedPreferences.getInstance();
      _prefs.setString("email", userCredential.user!.email.toString() );

      print(_prefs);
      Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));
    }

  }



  // uploadFile({required File file,}) async {
  //
  //   if (file != null) {
  //     var uploadTask = await _firebaseStorage
  //         .ref('images')
  //         .child("${DateTime.now()}")
  //         .putFile(file!);
  //
  //     imageurl = await uploadTask.ref.getDownloadURL();
  //     print("======================= image url ====================");
  //     print(imageurl);
  //
  //     // ScaffoldMessenger.of(context)
  //     //     .showSnackBar(SnackBar(content: Text("image uploaded")));
  //     // setState(() {});
  //     // Navigator.pop(context);
  //
  //   }
  // }

  UserDetails(name, email, password,image) {

    UserModel userModel = UserModel(name: name, email: email, password: password, image: image );
    _authuser.doc(email).set(userModel.toMap());

  }



}
