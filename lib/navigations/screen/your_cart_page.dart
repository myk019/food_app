// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:food_app/commons/colours.dart';
// import 'package:food_app/commons/icons.dart';
// import 'package:food_app/commons/images.dart';
// import 'package:food_app/feature/auth/repository/auth_repository.dart';
// import 'package:food_app/feature/streamCategoryApp/controller/categoryApp_controller.dart';
// import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
// import 'package:food_app/model/itemApp_model.dart';
//
// import '../../commons/snack_bar_page.dart';
// import '../../main.dart';
//
// class YourCartPage extends ConsumerStatefulWidget {
//   const YourCartPage({super.key});
//
//   @override
//   ConsumerState<YourCartPage> createState() => _YourCartPageState();
// }
//
// class _YourCartPageState extends ConsumerState<YourCartPage> {
//
//
//               // deleteUser(List cart){
//               //   ref.watch(streamCartProvider).deleteTheProduct(cart);
//               //   showSnackBar(context, "Deleting.....");
//               // }
//
//
//   cartCard(){
//     return ref.watch(streamCartProvider).when(data:(data){
//       return  ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemCount: data.length,
//         itemBuilder: (BuildContext context, int index) {
//           return  Slidable(
//             endActionPane: ActionPane(
//               motion: BehindMotion(),
//               children: [
//                 Container(
//                   child: SlidableAction(
//                     onPressed: (context) {
//
//                     },
//                     backgroundColor: Colors.transparent,
//                     foregroundColor: Colors.green,
//                     icon: Icons.edit,
//                     label: "Edit",
//
//                   ),
//                 ),
//                 SlidableAction(
//                   onPressed: (context) {
//
//                   },
//                   backgroundColor: Colors.transparent,
//                   foregroundColor: Colors.red,
//                   icon: Icons.delete,
//                   label: "Delete",
//
//                 )
//
//               ],
//             ),
//          //  child: Text(data[index]['ItemName']),
//
//             child: Container(
//               height: h*0.18,
//               width: w*1,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(w*0.03),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: h*0.11,
//                     width: w*0.25,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(w*0.03),
//                         color: Colors.red,
//                         image: DecorationImage(image: NetworkImage(data[index]["ItemImage"]),fit: BoxFit.cover)
//                       // image: DecorationImage(image: image)
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(data[index]["ItemName"],style: TextStyle(
//                           color: colors.Black
//                       ),),
//                       Text("${data[index]["ItemDescriptionofslect"]}"),
//                       Text(data[index]["ItemPrice"].toString())
//                     ],
//                   ),
//                   data[index]['ItemQty'].toString()!=0? SizedBox(
//                     height: h*0.04,
//                     width: w*0.2,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).update({
//                               "ItemQty":data![index]["ItemQty"]+1
//                             });
//                             data[index]["ItemQty"]++;
//                             totalPrize();
//                             setState(() {
//
//                             });
//                           },
//                           child: Container(
//                             height: h*0.07,
//                             width: w*0.07,
//                             decoration: BoxDecoration(
//                                 color: colors.PrimaryColour,
//                                 shape: BoxShape.circle
//                             ),
//                             child: Icon(Icons.add,color: Colors.white,),
//                           ),
//                         ),
//                         Text(data[index]["ItemQty"].toString()),
//                         GestureDetector(
//                           onTap: () {
//                             FirebaseFirestore.instance.collection("Users").doc(data[index].id).update({
//                               "ItemQty":data![index]["ItemQty"]-1
//                             });
//                             data[index]['ItemQty']<=0?0:data[index]['ItemQty']--;
//                             totalPrize();
//                             setState(() {
//
//                             });
//                           },
//                           child: Container(
//                             height: h*0.07,
//                             width: w*0.07,
//                             decoration: BoxDecoration(
//                                 color: colors.PrimaryColour,
//                                 shape: BoxShape.circle
//                             ),
//                             child: Icon(Icons.remove,color: Colors.white,),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ):GestureDetector(
//                     onTap: () {
//                       data[index]['ItemQty']++;
//                       totalPrize();
//                       setState(() {
//                       });
//                     },
//                     child: Container(
//                       height: h*0.05,
//                       width: w*0.2,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(w*0.03),
//                         color: colors.PrimaryColour,
//
//                       ),
//                       // child: Center(child: Text("Add",style: TextStyle(color: Colors.white),)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) { return SizedBox(height: h*0.03,); },
//
//       );
//
//     }
//
//
//       ,
//         error: (error, stackTrace) => CircularProgressIndicator(),
//         loading: () => Text("loading"),);
//   }
//
//
//   int total=0;
//
//   List<QueryDocumentSnapshot<Map<String, dynamic>>>? data;
//
//   totalPrize(){
//     FirebaseFirestore.instance.collection('Users').snapshots().listen((event){
//       total=0;
//       data=event.docs;
//       for(int i=0;i<event.docs.length;i++){
//         total=(event.docs[i]['rate']*event.docs[i]['Qty'])+total;
//       }
//       setState(() {
//
//       });
//     });
//   }
//
//
//   @override
//   void initState() {
//     totalPrize();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.Background,
//       appBar: AppBar(
//         backgroundColor: colors.Background,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: SvgPicture.asset(
//               IconConst.leftArrow,
//               height: w*0.03,
//               width: w*0.06,
//             ),
//           ),
//         ),
//         title: Column(
//           children: [
//             Text("Delivery to",style: TextStyle(
//                 color: colors.Black,
//                 fontSize: w*0.03
//             ),),
//             Text("lekki phase 1, Estate",style: TextStyle(
//                 color: colors.Red,
//                 fontSize: w*0.03
//             ),)
//           ],
//         ),
//         centerTitle: true,
//         actions: [
//           SizedBox(
//             height: w*0.12,
//             width: w*0.12,
//             // color: colors.Red,
//             child: CircleAvatar(
//               radius: w*0.02,
//               backgroundColor: colors.White,
//               child: SvgPicture.asset(IconConst.googleIcon),
//             ),
//           ),
//           SizedBox(width: w*0.03,),
//         ],
//
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Your cart",style: TextStyle(fontSize: w*0.05,fontWeight: FontWeight.w600
//               ),),
//               SizedBox(height: h*0.02,),
//               Container(
//                 width: w*1,
//                 height: h*0.85,
//                 child: cartCard(),
//               )
//             ],
//
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//         height: h*0.1,
//         width: w*1,
//         color: colors.White,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Divider(
//               thickness: w*0.01,
//             ),
//             // SizedBox(height:w*0.05),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("Total",style: TextStyle(
//                     fontSize: w*0.04,
//                     // fontWeight: FontWeight.w800
//                 ),),
//                 Text("$total",style: TextStyle(
//                     fontSize: w*0.06,
//                     fontWeight: FontWeight.w800
//                 ),),
//               ],
//             )
//           ],
//         ),
//       ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//     );
//
//   }
// }
