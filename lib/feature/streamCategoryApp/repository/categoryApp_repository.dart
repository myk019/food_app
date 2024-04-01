import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/providers/firebase_provider.dart';

import '../../../model/category_model.dart';
import '../../../model/itemApp_model.dart';


final streamCategoryAppRepository =Provider((ref) => StreamCategoryApp(firestore: ref.watch(firestoreprovider)));

class StreamCategoryApp{
 final FirebaseFirestore _firestore;

 StreamCategoryApp({required FirebaseFirestore firestore}):_firestore=firestore;

 CollectionReference get _category =>_firestore.collection("Categories");

 streamCategory(){
   return _category.snapshots().map((event) => event.docs.map((e) => CategoryModelApp.fromMap(e.data()as Map<String,dynamic>)).toList());
 }

 Stream streamItem(categoryId){
  return _category.doc(categoryId).collection("Subitems").snapshots().map((event) => event.docs.map((e) => itemAppModel.fromMap(e.data())).toList());
 }



}