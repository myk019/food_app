// import 'package:cloud_firestore/cloud_firestore.dart';
//
// getfun() async {
//   DocumentSnapshot<Map<String, dynamic>> data=await FirebaseFirestore.instance.collection("users").doc(currentUserEmail).get();
//   currentUserModel=UserModel.fromMap(data!.data()!);
//   List fav=currentUserModel!.favourites;
//   if(fav!.isNotEmpty){
//     print("ghjkl,,,,");
//     print("cvbnm,");
//     if(fav!.contains(widget.id)){
//       ref.read(favour.notifier).update((state) => true);
//     }
//     else{
//       ref.read(favour.notifier).update((state) => false);
//     }
//   }
//
// }
// favFunc() async {
//   DocumentSnapshot<Map<String, dynamic>> data=await FirebaseFirestore.instance.collection("users").doc(currentUserEmail).get();
//   var data2=await FirebaseFirestore.instance.collection("product").doc(widget.id).get();
//   ProductModel productModel = ProductModel.fromMap(data2.data()!);
//   currentUserModel=UserModel.fromMap(data!.data()!);
//   List fav=currentUserModel!.favourites;
//   List favUser=productModel.favUser;
//   print(fav);
//   if(fav!.contains(widget.id)){
//     fav!.remove(widget.id);
//   }else{
//     fav!.add(widget.id);
//   }if(favUser.contains(currentUserEmail)){
//     favUser.remove(currentUserEmail);
//   }else{
//     favUser.add(currentUserEmail);
//   }
//
//   FirebaseFirestore.instance.collection("product").doc(widget.id).update({
//     "favUser":favUser
//   });
//   FirebaseFirestore.instance.collection("users").doc(currentUserEmail).update({
//     "favourites": fav
//   });
//   var data1=await FirebaseFirestore.instance.collection("users").doc(currentUserEmail).get();
//   currentUserModel = UserModel.fromMap(data1.data()!);
//   var data3=await FirebaseFirestore.instance.collection("product").doc(widget.id).get();
//   productModel=ProductModel.fromMap(data3.data()!);
//   }