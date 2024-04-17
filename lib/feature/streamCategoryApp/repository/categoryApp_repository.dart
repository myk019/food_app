import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/providers/firebase_provider.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/model/cart_model.dart';
import 'package:food_app/model/user_model.dart';

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


 addCartFunc({required CartModel cartList}) async {
List cart=[];
  UserModel User=await _users.doc(userId).get().then((value) => UserModel.fromMap(value.data() as Map<String,dynamic>)
);
  for(var data in User.cart){
   cart.add(data);
  }
  cart.add(cartList.toMap());
  currentUserModel!.cart=cart;
print(cart);
  _users.doc(userId).update({'cart':cart});
 }

 cartItem(){
   return _users.doc(userId).snapshots().map((snapshot){
     List<Map<String, dynamic>> dataList = [];
     if (snapshot.exists) {
      Map <String,dynamic> a = snapshot.data() as Map<String,dynamic>;
      dataList = List<Map<String, dynamic>>.from(a['cart']);
   }
     return dataList;
   });
 }

 deleteProduct(List cart){
   _users.doc(currentUserModel!.id).delete();
 }


}