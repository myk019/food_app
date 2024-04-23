import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/images.dart';
import 'package:food_app/feature/streamCategoryApp/controller/categoryApp_controller.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:food_app/model/itemApp_model.dart';

import '../../feature/streamCategoryApp/screen/selected_item_page.dart';
import '../../main.dart';

class FavouritePage extends ConsumerStatefulWidget {
  final List a;

  const FavouritePage({super.key, required this.a});

  @override
  ConsumerState<FavouritePage> createState() => _FavouritePageState();
}



class _FavouritePageState extends ConsumerState<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ref.watch(streamItemFav).when(
              data: (data) {
                return Expanded(
                  child:ListView.separated(
                    itemCount: data["Fav"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectedItemPage(selectedItem: itemAppModel.fromMap(data["Fav"][index]),),));
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
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: w*0.02,
                    );
                  },
                  ),
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return Center(child: CircularProgressIndicator());
              },
          ),

        ],
      ),
    );
  }
}
