

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/providers/firebase_provider.dart';
import 'package:food_app/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

final authrepositoryprovider = Provider((ref) => Authrepository(
    auth: ref.watch(authprovider), firestore: ref.watch(firestoreprovider)));

class Authrepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Authrepository(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  CollectionReference get _authuser => _firestore.collection("Users");

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
    }

  }

  UserDetails(name, email, password) {
    UserModel userModel =
        UserModel(name: name, email: email, password: password, image: "");
    _authuser.doc(email).set(userModel.toMap());
  }
}
