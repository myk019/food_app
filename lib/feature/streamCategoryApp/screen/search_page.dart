import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/lottie.dart';
import 'package:food_app/feature/streamCategoryApp/controller/categoryApp_controller.dart';
import 'package:food_app/feature/streamCategoryApp/screen/selected_item_page.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  TextEditingController searchController = TextEditingController();
  final search = StateProvider((ref) => "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: h*0.8,
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.065,
              ),
              ref
                  .watch(streamSearchProvider(ref.watch(search)))
                  .when(data: (data) {
                    print("//////////////////////////////////////////////////////${data}");
                    print(data.length);
                    return
                  data.isNotEmpty?

                  ListView.separated(
                        itemCount: data.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectedItemPage(selectedItem: data[index], CategoryId: data[index].categoryId)));
                              // print(cart);
                            },
                            child: Container(
                              height: h * 0.18,
                              width: w * 1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.03),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w*0.1,right: w*0.05),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(

                                      height: h * 0.11,
                                      width: w * 0.25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(w * 0.03),
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: NetworkImage(data[index].ItemImage),
                                              fit: BoxFit.cover)
                                        // image: DecorationImage(image: image)
                                      ),
                                    ),
                                    Container(
                                      width: w*0.55,
                                      // color: Colors.red,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].ItemName,
                                            style: TextStyle(color: colors.Black,fontWeight: FontWeight.w700,fontSize: w*0.045),
                                          ),
                                          Text(data[index].ItemDescription,style: TextStyle(color: colors.Black,fontWeight: FontWeight.w500,fontSize: w*0.04),),
                                          Text(
                                            "₹ ${data[index].ItemPrice.toString()}",style: TextStyle(fontSize: w*0.045,fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                    // GestureDetector(
                                    //     // onTap: () {
                                    //     //   // FirebaseFirestore.instance.collection("Users").doc(userId).update(
                                    //     //   //     {
                                    //     //   //       "Fav":FieldValue.arrayRemove([data["Fav"][index]])
                                    //     //   //     });
                                    //     //   deleteFav(userId!, data["Fav"][index]);
                                    //     // },
                                    //     child: Icon(Icons.delete,color: colors.Red,))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: w*0.02,
                        );
                      },
                      ):Center(
                        child: Lottie.asset(lottieConst.emptySearch),
                      );
                  }, error: (error, stackTrace) {
                print(error.toString());
                    return Text(error.toString());
                  }, loading: () {
                    return Center(child: CircularProgressIndicator());
                  },),
              // SizedBox(height: h*0.02,)
            ],
          ),
        ),
      ),
      floatingActionButton: TextFormField(
        controller: searchController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: w * 0.05),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          ref
              .read(search.notifier)
              .update((state) => value.toString().toUpperCase());
        },
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.all(w * 0.023),
            ),
            constraints:
            BoxConstraints(maxWidth: w * 0.96, maxHeight: w * 0.2),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(w * 0.05)),
            filled: true,
            fillColor: colors.White,
            labelText: "Search",
            labelStyle: TextStyle(
                fontSize: w * 0.04,
                fontWeight: FontWeight.w500,
                color: colors.Grey),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colors.Grey2),
                borderRadius: BorderRadius.circular(w * 0.05)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colors.Grey2),
                borderRadius: BorderRadius.circular(w * 0.05))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}
