//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:food_app/core/providers/firebase_provider.dart';
// import 'package:food_app/feature/auth/screen/create_account.dart';
// import 'package:food_app/main.dart';
// import 'package:food_app/model/user_model.dart';
// import 'package:food_app/navigations/screen/bottom_navigation.dart';
// import 'package:food_app/utube/homepage_utube.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:riverpod/riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// import '../../../commons/snack_bar_page.dart';
// import '../screen/create_account.dart';
//
// final authrepositoryprovider = Provider((ref) => Authrepository(auth: ref.watch(authprovider), firestore: ref.watch(firestoreprovider)));
//
// class Authrepository {
//   final FirebaseAuth _auth;
//   final FirebaseFirestore _firestore;
//   // final FirebaseStorage _firebaseStorage;
//   Authrepository(
//       {required FirebaseAuth auth, required FirebaseFirestore firestore})
//       : _auth = auth,
//         _firestore = firestore;
//   // _firebaseStorage=firebaseStorage;
//
//   CollectionReference get _authuser => _firestore.collection("Users");
//
//   // String imageurl = "";
//
//
//   signInWithGoogle(context) async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     final userCredential = await _auth.signInWithCredential(credential);
//     // late UserModel userData;
//
//
//     late UserModel userData;
//
//     if (userCredential.additionalUserInfo!.isNewUser) {
//       userData = UserModel(
//           name: userCredential.user!.displayName.toString(),
//           email: userCredential.user!.email.toString(),
//           password: "",
//           image: userCredential.user!.photoURL.toString(), cart: []);
//
//       await _authuser.doc(userCredential.user!.email!).set(userData.toMap());
//     }else{
//
//
//       User? user=userCredential.user;
//       userName=user?.displayName.toString();
//       userEmail=user?.email.toString();
//       userImg=user!.photoURL!;
//
//       SharedPreferences _prefs= await SharedPreferences.getInstance();
//       _prefs.setString("email", userCredential.user!.email.toString());
//
//       print(_prefs);
//       Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));
//     }
//
//   }
//
//   UserDetails(name, email, password,image) {
//
//     UserModel userModel = UserModel(name: name, email: email, password: password, image: image, cart: [] );
//     _authuser.doc(email).set(userModel.toMap());
//
//   }
//
//   emailLogin(email,password,context) async {
//
//     QuerySnapshot data = await _authuser.where("email",isEqualTo: email).where("password",isEqualTo: password).get();
//     if(data.docs.isEmpty){
//       print("------------1-----------------------");
//       showSnackBar(context, "User doesn't Exist");
//     }else if(data.docs.isNotEmpty){
//       print("------------2-----------------------");
//
//       String usrImg= data.docs[0]["image"];
//
//       userEmail=data.docs[0]["email"];
//       userImg=data.docs[0]["image"]??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKc6EnanoKKj61vCCamKeDwXelxNzUElzIWWDgf75XNEa1-uaHgiSq32hF7bp73Tq9nsY&usqp=CAU";
//       userName=data.docs[0]["name"];
//       Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));
//     }else{
//       print("------------3-----------------------");      return null;
//     }
//   }
//
//
//
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/core/providers/firebase_provider.dart';
import 'package:food_app/feature/auth/screen/create_account.dart';
import 'package:food_app/main.dart';
import 'package:food_app/model/user_model.dart';
import 'package:food_app/utube/homepage_utube.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../../commons/snack_bar_page.dart';



UserModel? currentUserModel;

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
    // late UserModel userData;


    var data= await FirebaseFirestore.instance.collection("Users").where("email", isEqualTo: userCredential.user!.email).get();

// print(data.docs);
    if(data.docs.isEmpty){
      User user=userCredential.user!;
      userName=user?.displayName.toString();
      userEmail=user?.email.toString();
      userImg=user!.photoURL!;
      userId=user.uid.toString();


      UserModel userModel = UserModel(name: userName, email: userEmail??'', password: '', image: userImg, id: '', cart: []);

      Navigator.push(context, CupertinoPageRoute(builder: (context) => CreatePage(google: true,userModel: userModel,),));
    }else{
      User? user=userCredential.user;
      userName=user?.displayName.toString();
      userEmail=user?.email.toString();
      userImg=user!.photoURL!;
      userId=user.uid.toString();

      SharedPreferences _prefs= await SharedPreferences.getInstance();
      _prefs.setString("email", userCredential.user!.email.toString() );


      print(".....................................................................");
      print(_prefs);
      Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));
    }

  }


  // FirebaseFirestore.instance.collection("Users").where('email',isEqualTo: userCredential.user?.email).get().then((value) {
  //   UserModel.fromMap()
  // });


  // if(currentUserModel!.id.isEmpty){
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=> CreatePage(google: true)));
  // }


  //
  // if (userCredential.additionalUserInfo!.isNewUser) {
  //   userData = UserModel(
  //       name: userCredential.user!.displayName.toString(),
  //       email: userCredential.user!.email.toString(),
  //       password: "",
  //       image: userCredential.user!.photoURL.toString(),
  //       id: userCredential.user!.uid.toString());
  //
  //   Navigator.push(context, CupertinoPageRoute(builder: (context) => CreatePage(userModel: userData,google: true,),));
  //  await _authuser.add(userData.toMap());
  //
  //   print("===========================================");
  //   print(userData);
  //   print("===========================================");
  //
  //
  //
  //
  // }else{
  //   User? user=userCredential.user;
  //   userName=user?.displayName.toString();
  //   userEmail=user?.email.toString();
  //   userImg=user!.photoURL!;
  //   userId=user.uid.toString();
  //
  //   SharedPreferences _prefs= await SharedPreferences.getInstance();
  //   _prefs.setString("email", userCredential.user!.email.toString() );
  //
  //
  //   print(".....................................................................");
  //   print(_prefs);
  //   Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));
  // }


  googleNewUser(name,email,password,image,id){
    UserModel userModel=UserModel(name: name, email: email, password: password, image: image, id: id, cart: []);
    _authuser.add(userModel.toMap());
  }


  UserDetails(name, email, password,image,id, cart) {

    UserModel userModel = UserModel(name: name, email: email, password: password, image: image, id: id, cart: [] );
    _authuser.add(userModel.toMap()).then((value) {
      value.update(userModel.copyWith(id: value.id).toMap());
    });

  }

  emailLogin(email,password,context) async {

    QuerySnapshot data = await _authuser.where("email",isEqualTo: email)
    // .where("password",isEqualTo: password)
        .get();
    if(data.docs.isEmpty){
      print("------------1-----------------------");
      showSnackBar(context, "User doesn't Exist");
    }else if(data.docs.isNotEmpty){
      print("------------2-----------------------");

      // String usrImg= data.docs[0]["image"];


      if(data.docs[0]["password"]== password){

        userEmail=data.docs[0]["email"];
        userImg=data.docs[0]["image"]??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKc6EnanoKKj61vCCamKeDwXelxNzUElzIWWDgf75XNEa1-uaHgiSq32hF7bp73Tq9nsY&usqp=CAU";
        userName=data.docs[0]["name"];
        Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePageUtube(),));}
      else{
        showSnackBar(context, "Wrong password");

      }

    }else{
      print("------------3-----------------------");      return null;
    }


  }



}
