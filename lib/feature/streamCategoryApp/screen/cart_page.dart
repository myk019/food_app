import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:lottie/lottie.dart';

import '../../../commons/icons.dart';
import '../../auth/repository/auth_repository.dart';
import '../controller/categoryApp_controller.dart';
import '../../../main.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {


  bool itemCount = true;


  cartCard(){
    return ref.watch(streamCartProvider).when(data:(data){
      return data.isNotEmpty?ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return  Slidable(
            endActionPane: ActionPane(
              motion: BehindMotion(),
              children: [
                Container(
                  child: SlidableAction(
                    onPressed: (context) {

                    },
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.green,
                    icon: Icons.edit,
                    label: "Edit",

                  ),
                ),
                SlidableAction(
                  onPressed: (context) {
                    FirebaseFirestore.instance.collection("Users").doc(currentUserModel!.id).update(
                        {
                          "cart":FieldValue.arrayRemove([data[index]])
                        });
                    },
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.red,
                  icon: Icons.delete,
                  label: "Delete",

                )

              ],
            ),
            //  child: Text(data[index]['ItemName']),

            child: Container(
              height: h*0.18,
              width: w*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w*0.03),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: h*0.11,
                    width: w*0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.03),
                        color: Colors.red,
                        image: DecorationImage(image: NetworkImage(data[index]["ItemImage"]),fit: BoxFit.cover)
                      // image: DecorationImage(image: image)
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index]["ItemName"],style: TextStyle(
                          color: colors.Black
                      ),),
                      Text("${data[index]["ItemDescriptionofslect"]}"),
                      Text(data[index]["ItemPrice"].toString())
                    ],
                  ),
                  SizedBox(
                    height: h*0.04,
                    width: w*0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            //var data = await FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).get();
                            List? cart= currentUserModel?.cart;
                            // int currentQty = cart[index]['ItemQty'];
                            // cart[index]['ItemQty'] = currentQty+1;
                            cart![index]["ItemQty"]++;

                            FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).update(currentUserModel!.copyWith(cart: cart).toMap());
                            totalPrize();
                            setState(() {

                            });
                          },
                          child: Container(
                            height: h*0.07,
                            width: w*0.07,
                            decoration: BoxDecoration(
                                color: colors.PrimaryColour,
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.add,color: Colors.white,),
                          ),
                        ),
                        Text( data[index]["ItemQty"].toString() ),


                        data[index]['ItemQty']==1 ? SizedBox() : GestureDetector(
                          onTap: () async {

                            //var data = await FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).get();
                            List? cart= currentUserModel?.cart;
                            // int currentQty = cart[index]['ItemQty'];
                            // cart[index]['ItemQty'] = currentQty+1;
                            cart![index]["ItemQty"]--;

                            FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).update(currentUserModel!.copyWith(cart: cart).toMap());
                            totalPrize();
                            setState(() {

                            });
                          },
                          child: Container(
                            height: h*0.07,
                            width: w*0.07,
                            decoration: BoxDecoration(
                                color: colors.PrimaryColour,
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.remove,color: Colors.white,),
                          ),
                        ),




                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) { return SizedBox(height: h*0.03,); },

      ):
      Column(
        children: [
          Center(child: Text("You Haven't Added Any Item",style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: w*0.04
          ),)),
        ],
      );

    },
      error: (error, stackTrace) => CircularProgressIndicator(),
      loading: () => Text("loading"),);
  }


  int total=0;

  List<QueryDocumentSnapshot<Map<String, dynamic>>>? data;

  totalPrize(){
    FirebaseFirestore.instance.collection('Users').doc(currentUserModel!.id).snapshots().listen((event){
      total=0;

      for(int i=0;i<event["cart"].length;i++){
        total=(event["cart"][i]['ItemPrice']*event["cart"][i]['ItemQty'])+total;
      }
      setState(() {

      });
    });
  }


  @override
  void initState() {
    totalPrize();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your cart",style: TextStyle(fontSize: w*0.05,fontWeight: FontWeight.w600
              ),),
              SizedBox(height: h*0.02,),
              Container(
                width: w*1,
                height: h*0.85,
                child: cartCard(),
              )
            ],

          ),
        ),
      ),
      floatingActionButton: Container(
        height: h*0.1,
        width: w*1,
        color: colors.White,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              thickness: w*0.01,
            ),
            // SizedBox(height:w*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total",style: TextStyle(
                  fontSize: w*0.04,
                  // fontWeight: FontWeight.w800
                ),),
                Text("$total",style: TextStyle(
                    fontSize: w*0.06,
                    fontWeight: FontWeight.w800
                ),),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
