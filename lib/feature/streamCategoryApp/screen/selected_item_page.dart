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
import 'package:food_app/feature/streamCategoryApp/screen/cart_page.dart';

// import 'package:food_app/navigations/screen/your_cart_page.dart';
import 'package:food_app/utube/homepage_utube.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../commons/icons.dart';
import '../../../commons/images.dart';
import '../../../navigations/screen/bottom_navigation.dart';
import '../../auth/repository/auth_repository.dart';
import '../../../main.dart';

class SelectedItemPage extends ConsumerStatefulWidget {
  // final UserModel crntModel;
  final itemAppModel selectedItem;
  final String CategoryId;

  const SelectedItemPage(
      {super.key, required this.selectedItem, required this.CategoryId});

  @override
  ConsumerState<SelectedItemPage> createState() => _SelectedItemPageState();
}

class _SelectedItemPageState extends ConsumerState<SelectedItemPage> {
  int selectedIndex = 0;
  List itemsList = [];
  bool added = false;
  Map currentItem = {};
  List checkList = [];
  bool checked = false;

  check(value) {}

  checkFun() {
    print(currentUserModel!.cart);
    print(widget.selectedItem.itemId);
    for (int i = 0; i < currentUserModel!.cart.length; i++) {
      if (currentUserModel!.cart[i]["ItemId"] == widget.selectedItem.itemId &&
          currentUserModel!.cart[i]["ItemQty"] > 0) {
        added = true;
        currentItem = currentUserModel!.cart[i];
        break;
      } else {
        added = false;
      }
    }
    setState(() {});
    print(added);
  }

  ///GEOLOCATION

  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String _currentAdress = "";

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {}
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromCoordinates() async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);
      Placemark place = placemark[0];
      setState(() {
        _currentAdress = "${place.locality},${place.country}";
      });
    } catch (e) {}
  }

  fetch() async {
    _currentLocation = await _getCurrentLocation();
    await _getAddressFromCoordinates();
    setState(() {});
  }

  addingCart() async {
    // var data = await FirebaseFirestore.instance.collection("Users").doc(userId).get();
    // List ExistCart= data['ItemId'];

    CartModel cartModel = CartModel(
      ItemName: widget.selectedItem.ItemName,
      ItemId: widget.selectedItem.itemId,
      ItemPrice: int.parse(widget.selectedItem.ItemPrice.toString()),
      ItemQty: 1,
      ItemImage: widget.selectedItem.ItemImage,
      ItemDescriptionofslect: widget.selectedItem.ItemDescription,
    );
    ref
        .watch(streamCategoryAppController.notifier)
        .addingCartItem(cartList: cartModel);
  }

  @override
  void initState() {
    fetch();
    checkFun();
    // TODO: implement initState
    super.initState();
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
              height: w * 0.03,
              width: w * 0.06,
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
              _currentAdress.isNotEmpty ? _currentAdress : ("Location"),

              // _position != null?("Current Location"+_position.toString()):("no Location data"),
              style: TextStyle(color: colors.Red, fontSize: w * 0.03),
            ),
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
              backgroundImage: NetworkImage(userImg)  ,
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
                // color: colors.White,
                borderRadius: BorderRadius.circular(w * 0.05),
                image: DecorationImage(
                    image: NetworkImage(widget.selectedItem.ItemImage),
                    fit: BoxFit.fill),
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
              // child: Image.network(widget.selectedItem.ItemImage,fit: BoxFit.cover,)
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
          SizedBox(
            height: h * 0.025,
          ),
          ref.watch(streamToppingsProvider(widget.CategoryId)).when(
            data: (data) {
              return Container(
                height: h * 0.2,
                width: w * 0.85,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(w*0.04),
                //   border: Border.all(color: colors.Grey2)
                // ),
                // color: Colors.blue,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                              radius: w * 0.04,
                              backgroundImage: NetworkImage(data[index].image)),
                          title: Text(
                            data[index].name,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Checkbox(
                              activeColor: colors.PrimaryColour,
                              side: BorderSide(color: colors.Grey),
                              tristate: false,
                              shape: CircleBorder(),
                              value: checkList.contains(index),
                              onChanged: (newValue) {
                                if (checkList.contains(index)) {
                                  checkList.remove(index);
                                } else {
                                  checkList.add(index);
                                }
                                setState(() {});
                              }),
                        )
                      ],
                    );
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //    CheckboxListTile(
                        // //      leading: CircleAvatar(
                        // // radius: w*0.04,
                        // //   backgroundImage: NetworkImage(data[index].image),
                        // // ),
                        //      title: Text(data[index].name),
                        //      trailing:
                        //    )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: w * 0.035,
                    );
                  },
                  itemCount: data.length,
                ),
              );
            },
            error: (err, stack) {
              return Text(stack.toString());
            },
            loading: () {
              return CircularProgressIndicator();
            },
          ),
          SizedBox(
            height: h * 0.03,
          ),
          added
              ? SizedBox(
                  height: h * 0.04,
                  width: w * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          //var data = await FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).get();
                          // int currentQty = cart[index]['ItemQty'];
                          // cart[index]['ItemQty'] = currentQty+1;
                          List? cart = currentUserModel?.cart;
                          Map a = cart!
                              .where((element) =>
                                  element["ItemId"] ==
                                  widget.selectedItem.itemId)
                              .first;
                          a["ItemQty"]++;

                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(currentUserModel?.id)
                              .update(currentUserModel!
                                  .copyWith(cart: cart)
                                  .toMap());

                          setState(() {});
                        },
                        child: Container(
                          height: h * 0.07,
                          width: w * 0.07,
                          decoration: BoxDecoration(
                              color: colors.PrimaryColour,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(currentItem["ItemQty"].toString()),
                      GestureDetector(
                        onTap: () async {
                          //var data = await FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).get();
                          List? cart = currentUserModel?.cart;
                          // int currentQty = cart[index]['ItemQty'];
                          // cart[index]['ItemQty'] = currentQty+1;
                          Map a = cart!
                              .where((element) =>
                                  element["ItemId"] ==
                                  widget.selectedItem.itemId)
                              .first;
                          a["ItemQty"]--;
                          checkFun();
                          if (a["ItemQty"] == 0) {
                            cart.removeWhere((element) =>
                                element["ItemId"] ==
                                widget.selectedItem.itemId);
                          }

                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(currentUserModel?.id)
                              .update(currentUserModel!
                                  .copyWith(cart: cart)
                                  .toMap());

                          setState(() {});
                        },
                        child: Container(
                          height: h * 0.07,
                          width: w * 0.07,
                          decoration: BoxDecoration(
                              color: colors.PrimaryColour,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // currentUserModel!.cart[]['ItemQty']==1 ? SizedBox() : GestureDetector(
                      //   onTap: () async {
                      //
                      //     //var data = await FirebaseFirestore.instance.collection("Users").doc(currentUserModel?.id).get();
                      //     // int currentQty = cart[index]['ItemQty'];
                      //     // cart[index]['ItemQty'] = currentQty+1;
                      //     List? cart= currentUserModel?.cart;
                      //     cart![index]["ItemQty"]--;
                      //
                      //     FirebaseFirestore.instance.collection("Users").doc(userId).update(currentUserModel!.copyWith(cart: cart).toMap());
                      //     totalPrize();
                      //     setState(() {
                      //
                      //     });
                      //   },
                      //   child: Container(
                      //     height: h*0.07,
                      //     width: w*0.07,
                      //     decoration: BoxDecoration(
                      //         color: colors.PrimaryColour,
                      //         shape: BoxShape.circle
                      //     ),
                      //     child: Icon(Icons.remove,color: Colors.white,),
                      //   ),
                      // ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    addingCart();
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => HomePageUtube(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Container(
                    height: h * 0.06,
                    width: w * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(w * 0.05),
                      gradient: LinearGradient(
                          colors: [
                            colors.PrimaryColour,
                            colors.PrimaryColour.withOpacity(0.9)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 10.0]),
                    ),
                    child: Center(
                        child: Text(
                      "Add to cart",
                      style: TextStyle(color: colors.White),
                    )),
                  ),
                )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => NavigationPage(
                bottomIndex: 4,
              ),
            ),
            (route) => false,
          );
        },
        child: CircleAvatar(
          radius: w * 0.08,
          backgroundColor: colors.PrimaryColour,
          child: Icon(
            Icons.shopping_cart,
            color: colors.White,
          ),
        ),
      ),
    );
  }
}
