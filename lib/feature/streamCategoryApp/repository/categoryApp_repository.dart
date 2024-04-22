import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/providers/firebase_provider.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/model/cart_model.dart';
import 'package:food_app/model/user_model.dart';

import '../../../model/category_model.dart';
import '../../../model/itemApp_model.dart';


// double totalPr= 0 ;

final streamCategoryAppRepository =Provider((ref) => StreamCategoryApp(firestore: ref.watch(firestoreprovider)));

// final totalProv = StateProvider<double>((ref) => totalPr);

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
  currentUserModel =await _users.doc(userId).get().then((value) => UserModel.fromMap(value.data() as Map<String,dynamic>)
);
  for(var data in currentUserModel!.cart){
   cart.add(data);
   print("-----------fdycvscgvudssbc aihsbciubasihcjaknscoub--------------------------aaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbccccccccccccccccc");
   print(cart);

  }
  cart.add(cartList.toMap());
  currentUserModel!.cart=cart;
  print("-------------------------------------aaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbccccccccccccccccc");
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



 //  double totalPrice(){
 //
 //   // double total = 0;
 //   // final totalGet = FirebaseFirestore.instance.collection('Users').doc(userId).get();
 //   // UserModel userModel = UserModel.fromMap(totalGet as Map<String, dynamic>);
 //   //
 //   //
 //   //
 //   // for(int i=0;i<userModel.cart.length;i++){
 //   //   total=(userModel.cart[i]['ItemPrice']*userModel.cart[i]['ItemQty'])+total;
 //   // }
 //   //
 //   // return total;
 //
 //    double total = 0;
 //
 //  //  FirebaseFirestore.instance.collection('Users').doc(userId).get().then((value) => UserModel.fromMap(value.data() as Map<String,dynamic>)).then((value){
 //  //   for(int i=0;i<value.cart.length;i++){
 //  //     total=(value.cart[i]['ItemPrice']*value.cart[i]['ItemQty'])+total;
 //  //   }
 //  // });
 //
 //    FirebaseFirestore.instance.collection('Users').doc(userId).snapshots().map((event) => UserModel.fromMap(event.data() as Map<String,dynamic> )).listen((events) {
 //
 //      print(events.cart.length);
 //      print("---------------000000--------");
 //        for(int i=0;i<events.cart.length;i++){
 //          print(events.cart[i]['ItemPrice']);
 //          print(events.cart[i]['ItemQty']);
 //          totalPr=(events.cart[i]['ItemPrice']*events.cart[i]['ItemQty'])+totalPr;
 //          print(totalPr);
 //        }
 //
 //    });
 //
 //    print("------------+++++-----------");
 //    print(userId);
 //    print(totalPr);
 //    return totalPr;
 // }



 deleteProduct(List cart){
   _users.doc(currentUserModel!.id).delete();
 }


}