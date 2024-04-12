import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/providers/firebase_provider.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';

import '../../../model/category_model.dart';
import '../../../model/itemApp_model.dart';



final streamCategoryAppRepository =Provider((ref) => StreamCategoryApp(firestore: ref.watch(firestoreprovider)));

class StreamCategoryApp{
 final FirebaseFirestore _firestore;

 StreamCategoryApp({required FirebaseFirestore firestore}):_firestore=firestore;

 CollectionReference get _category =>_firestore.collection("Categories");
 CollectionReference get _users =>_firestore.collection("Users");



 streamCategory(){
   return _category.snapshots().map((event) => event.docs.map((e) => CategoryModelApp.fromMap(e.data()as Map<String,dynamic>)).toList());
 }

  streamItem(categoryId){
   print("repository ----------------------- ${categoryId}");
  var data = _category.doc(categoryId).collection("Subitems").snapshots().map((event) => event.docs.map((e) => itemAppModel.fromMap(e.data())).toList());
  return data;
 }


 addCartFunc({required List cartList}){
  print("id ssssssssssssssssssssssssssssssssss 3");
  _users.doc(userId).update({'cart':cartList});
 }

 //  favItemsRep(){
 //  return _category.doc().collection("Subitems").snapshots().map((event) => event.docs.map((e) => itemAppModel.fromMap(e.data())).toList());
 // }


}