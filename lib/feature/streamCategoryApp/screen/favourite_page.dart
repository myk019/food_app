import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/images.dart';
import 'package:food_app/commons/lottie.dart';
import 'package:food_app/commons/snack_bar_page.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/feature/streamCategoryApp/controller/categoryApp_controller.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:food_app/model/itemApp_model.dart';
import 'package:lottie/lottie.dart';

import 'selected_item_page.dart';
import '../../../main.dart';

class FavouritePage extends ConsumerStatefulWidget {
  final List a;

  const FavouritePage({super.key, required this.a});

  @override
  ConsumerState<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends ConsumerState<FavouritePage> {


  deleteFav(String id,index){
    ref.read(deleteController).deleteFav(id,index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ref.watch(streamItemFav).when(
            data: (data) {
              return data["Fav"].isNotEmpty? Expanded(
                  child:AnimationLimiter(
                    child: ListView.separated(
                      itemCount: data["Fav"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: ScaleAnimation(
                              child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectedItemPage(selectedItem: itemAppModel.fromMap(data["Fav"][index]), CategoryId: data["Fav"][index]["categoryId"],),));
                            print(cart);
                          },
                          child: Container(
                            height: h * 0.18,
                            width: w * 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * 0.03),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: h * 0.11,
                                  width: w * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w * 0.03),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: NetworkImage(data["Fav"][index]["ItemImage"]),
                                          fit: BoxFit.cover)
                                    // image: DecorationImage(image: image)
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data["Fav"][index]["ItemName"],
                                      style: TextStyle(color: colors.Black),
                                    ),
                                    Text(data["Fav"][index]["ItemDescription"]),
                                    Text(data["Fav"][index]["ItemPrice"].toString())
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      // FirebaseFirestore.instance.collection("Users").doc(userId).update(
                                      //     {
                                      //       "Fav":FieldValue.arrayRemove([data["Fav"][index]])
                                      //     });
                                      deleteFav(userId!, data["Fav"][index]);
                                    },
                                    child: Icon(Icons.delete,color: colors.Red,))
                              ],
                            ),
                          ),
                        ),
                        ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: w*0.02,
                      );
                    },
                    ),
                  )
              ):Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: h*0.6,
                        width: w*0.6,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Lottie.asset(lottieConst.noFav),
                            Text("No Favourites",style: TextStyle(fontWeight: FontWeight.w900,fontSize: w*0.05),)
                          ],
                        )),

                  ],
                ),
              );
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}