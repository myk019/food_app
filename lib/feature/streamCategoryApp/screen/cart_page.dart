import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/lottie.dart';
import 'package:food_app/feature/payment/screen/payment_page.dart';
import 'package:food_app/feature/streamCategoryApp/repository/categoryApp_repository.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:food_app/model/booking_address_model.dart';
import 'package:food_app/model/user_model.dart';
import 'package:lottie/lottie.dart';

import '../../../commons/icons.dart';
import '../../../model/cart_model.dart';
import '../../booking/screen/booking_user.dart';
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
      return data.isNotEmpty?ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return  Slidable(
            endActionPane: ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    print("2222222222222222222222222222222222222222222222222222222222222222222222222222222222");
                    print(data[index]);
                    FirebaseFirestore.instance.collection("Users").doc(userId).update(
                        {
                          "cart":FieldValue.arrayRemove([data[index]])
                        }).then((value) async {
                          var data = await FirebaseFirestore.instance.collection("Users").doc(userId).get();
                          currentUserModel!.cart=data["cart"];
                          totalPrize();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: w*0.05,
                        ),
                        Center(
                          child: Container(
                              height: h*0.04,
                              width: w*0.1,
                              color: Colors.white,
                              child: Lottie.asset(lottieConst.delete,fit: BoxFit.fitHeight,)),
                        ),
                        SizedBox(
                          width: w*0.015,
                        ),

                        Text("Deleted Success",style: TextStyle(
                            fontSize: w*0.04,
                            color: colors.White
                        ),)
                      ],

                    ),backgroundColor: Colors.black.withOpacity(0.85),
                      behavior: SnackBarBehavior.floating,
                      showCloseIcon: true,
                      duration: Duration(seconds: 1),
                      padding:  EdgeInsets.only(bottom: w*0.012,top: w*0.001),
                      // duration: Duration(seconds: 2),
                    ));

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
              margin: EdgeInsets.all(w*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w*0.03),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                    color: colors.PrimaryColour.withOpacity(0.15),
                    blurRadius: 4
                  )
                ]
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
                            // int currentQty = cart[index]['ItemQty'];
                            // cart[index]['ItemQty'] = currentQty+1;
                            // ref.watch(streamCategoryAppController.notifier).totalPrice();
                            List? cart= currentUserModel?.cart;
                            print(cart);
                            cart![index]["ItemQty"]++;
                            FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).update(currentUserModel!.copyWith(cart: cart).toMap());
                            print(currentUserModel!.cart);
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


                        data[index]['ItemQty']<=1 ? SizedBox() : GestureDetector(
                          onTap: () async {

                            //var data = await FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).get();
                            // int currentQty = cart[index]['ItemQty'];
                            // cart[index]['ItemQty'] = currentQty+1;
                            // ref.watch(streamCategoryAppController.notifier).totalPrice();
                            List? cart= currentUserModel?.cart;
                            print(currentUserModel!.cart);
                            cart![index]["ItemQty"]--;
                            FirebaseFirestore.instance.collection("Users").doc(userId).update(currentUserModel!.copyWith(cart: cart).toMap());
                            print(currentUserModel!.cart);
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
        // separatorBuilder: (BuildContext context, int index) { return SizedBox(height: h*0.03,); },

      ):
      Container(
          width: w*1,
          height: h*0.5,
          // color: Colors.red,
          child: Column(
            children: [
              Container(
                height: h*0.35,
                  width: w*0.8,
                  child: Lottie.asset(lottieConst.emptyGif)),
              Text("You Haven't Added Any Item",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: w*0.05
              ),),
            ],
          ),

      );

    },
      error: (error, stackTrace) => CircularProgressIndicator(),
      loading: () => Text("loading"),);
  }


  int total=0;

  List<QueryDocumentSnapshot<Map<String, dynamic>>>? data;

  totalPrize() async{

    total=0;

    for(int i=0;i<currentUserModel!.cart.length;i++){
      total=(currentUserModel!.cart[i]['ItemPrice']*currentUserModel!.cart[i]['ItemQty'])+total;
    }
    print("000000000000000000000000000000000");
    print(total);
    print("000000000000000000000000000000000");

    setState(() {

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
    // final totalPrice=ref.watch(totalProv.notifier).state;
    // final funcTotalPr = ref.watch(totalPriceProvider.notifier).state;
    return Scaffold(
      backgroundColor: colors.Background,
      body: SingleChildScrollView(
        physics: currentUserModel!.cart.isEmpty?NeverScrollableScrollPhysics():BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.all(w*0.03),
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
        height: h*0.15,
        width: w*1,
        color: colors.White,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              thickness: w*0.004,
              color: colors.PrimaryColour,
            ),
            // SizedBox(height:w*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text("Total:",style: TextStyle(
                      fontSize: w*0.04,
                      // fontWeight: FontWeight.w800
                    ),),
                    SizedBox(width: w*0.03,),
                    // currentUserModel!.cart.isEmpty?Text("0",style: TextStyle(
                    //     fontSize: w*0.06,
                    //     fontWeight: FontWeight.w800
                    // ),):
                       Text("$total",style: TextStyle(
                        fontSize: w*0.06,
                        fontWeight: FontWeight.w800
                    ),),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    currentUserModel!.cart.isEmpty?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Cart is Empty"))):
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => deliveryAddress(pickedItem: currentUserModel!.cart),));
                  },
                  child: Container(
                    height: h*0.045,
                    width: w*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),
                      color: colors.PrimaryColour,

                    ),
                    child: Center(child: Text("Order Now",style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.w700,
                      fontSize: w*0.04
                    ),)),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
