import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/feature/streamCategoryApp/controller/categoryApp_controller.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:food_app/model/cart_model.dart';
import 'package:food_app/model/itemApp_model.dart';
import 'package:food_app/model/user_model.dart';
import 'package:food_app/navigations/screen/cart_page.dart';
import 'package:food_app/navigations/screen/your_cart_page.dart';

import '../../../commons/icons.dart';
import '../../../commons/images.dart';
import '../../../navigations/screen/bottom_navigation.dart';
import '../../auth/repository/auth_repository.dart';
import '../../../main.dart';

class SelectedItemPage extends ConsumerStatefulWidget {
  final itemAppModel selectedItem;
  const SelectedItemPage({super.key,required this.selectedItem});

  @override
  ConsumerState<SelectedItemPage> createState() => _SelectedItemPageState();
}

class _SelectedItemPageState extends ConsumerState<SelectedItemPage> {
  int selectedIndex=0;
  List itemsList = [];

  addingCart(){

    CartModel cartModel = CartModel(ItemName: widget.selectedItem.ItemName, ItemId: widget.selectedItem.itemId, ItemPrice: widget.selectedItem.ItemPrice,
        ItemQty: 1, ItemImage: widget.selectedItem.ItemImage, ItemDescriptionofslect: widget.selectedItem.ItemDescription,);
    print("frst");

    ref.watch(streamCategoryAppController.notifier).addingCartItem(cartList: cartModel);
  }


  //   var user=await FirebaseFirestore.instance.collection("users").doc(currentUserEmail).get();
//   currentUserModel = UserModel.fromMap(user.data()!);
//   var data2=await FirebaseFirestore.instance.collection("product").doc(data.id).get();
//   ProductModel productModel = ProductModel.fromMap(data2.data()!);
//   List fav=currentUserModel!.favourites;
//   List favUser=productModel.favUser;
//   print(fav);
//   if(fav.contains(data.id)){
//   fav.remove(data.id);
//   }else{
//   fav.add(data.id);
//   }if(favUser.contains(currentUserEmail)){
//   favUser.remove(currentUserEmail);
//   }else{
//   favUser.add(currentUserEmail);
//   }
//   FirebaseFirestore.instance.collection("product").doc(data.id).update({
//   "favUser":favUser
//   });
//   FirebaseFirestore.instance.collection("users").doc(currentUserEmail).update({
//   "favourites": fav
//   });
//   var data1=await FirebaseFirestore.instance.collection("users").doc(currentUserEmail).get();
//   currentUserModel = UserModel.fromMap(data1.data()!);
//   var data3=await FirebaseFirestore.instance.collection("product").doc(data.id).get();
//   productModel=ProductModel.fromMap(data3.data()!);
//   setState(() {
//
//   });
// }

  // addToCart() async {
  //   var cartData=await FirebaseFirestore.instance.collection("Users").doc(userId).get();
  //     currentUserModel=UserModel.fromMap(cartData.data()!);
  //     List emptycart=currentUserModel!.cart;
  //
  //     if(emptycart.contains(cartData.id)){
  //       emptycart.remove(cartData.id);
  //     }else{
  //       emptycart.add(cartData.id);
  //     }
  //
  //     // FirebaseFirestore.instance.collection("Users").doc(userId).update(
  //     //     {
  //     //       "cart":emptycart
  //     //     });
  //
  //
  //     var cart2=FirebaseFirestore.instance.collection("Users").doc(userEmail).get();
  //    // currentUserModel=UserModel.fromMap(cart2.data()!);
  //     setState(() {
  //
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      appBar: AppBar(
        backgroundColor: colors.Background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              IconConst.leftArrow,
              height: w*0.03,
              width: w*0.06,
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              "Delivery to",
              style: TextStyle(color: colors.Black, fontSize: w * 0.03),
            ),
            Text(
              "lekki phase 1, Estate",
              style: TextStyle(color: colors.Red, fontSize: w * 0.03),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            height: w * 0.12,
            width: w * 0.12,
            // color: colors.Red,
            child: CircleAvatar(
              radius: w * 0.02,
              backgroundColor: colors.White,
              child: SvgPicture.asset(IconConst.googleIcon),
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: h * 0.01,
          ),
          Center(
            child: Container(
              height: h * 0.25,
              width: w * 0.5,
              decoration: BoxDecoration(
                  color: colors.White,
                  borderRadius: BorderRadius.circular(w * 0.05),
                  boxShadow: [
                    BoxShadow(
                        color: colors.Black.withOpacity(.1),
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                        blurRadius: 5)
                  ],
                  // image: const DecorationImage(
                  //   image:NetworkImage(widget.)
                  // )
              ),
              child: Image.network(widget.selectedItem.ItemImage,fit: BoxFit.cover,)
            ),
          ),
          SizedBox(
            height: w * 0.07,
          ),
          Text(
            widget.selectedItem.ItemName,
            style: TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconConst.star),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text("4+")
                ],
              ),
              SizedBox(
                width: w * 0.05,
              ),
              Row(
                children: [
                  SvgPicture.asset(IconConst.thijj),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text("300cal")
                ],
              ),
              SizedBox(
                width: w * 0.05,
              ),
              Row(
                children: [
                  SvgPicture.asset(IconConst.clock),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text("5-10min")
                ],
              ),
            ],
          ),
          SizedBox(
            height: h * 0.03,
          ),
          Text(widget.selectedItem.ItemDescription),
          SizedBox(
            height: h * 0.03,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Toppings for you",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SizedBox(height: h*0.025,),

          Padding(
            padding: const EdgeInsets.only(left:20),
            child: SizedBox(
              height: h*0.065,
              width: w*1,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex=index;
                      setState(() {

                      });
                    },
                    child: Container(
                      height: h * 0.055,
                      width: w * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * 0.07),
                        border: Border.all(width: w*0.005,color: selectedIndex==index?colors.PrimaryColour:colors.White),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: w*0.035,
                          ),
                          Text("Cheese")
                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.035,); }, itemCount: 4,

              ),
            ),
          ),
          SizedBox(
            height: h*0.03,),
          GestureDetector(
            onTap: () {
              // addToCart();
              addingCart();
              print("5555555555555444444444444444444444444444444444444444444");
              Navigator.push(context, CupertinoPageRoute(builder: (context) => NavigationPage(),));
            },
            child: Container(
              height: h*0.06,
              width: w*0.7,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(w*0.05),
                gradient: LinearGradient(colors: [colors.PrimaryColour,colors.Red.withOpacity(0.9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1,10.0]
                ),
              ),
              child: Center(child: Text("Add to cart",style: TextStyle(
                  color: colors.White
              ),)),
            ),
          )
        ],
      ),
    );
  }
}
