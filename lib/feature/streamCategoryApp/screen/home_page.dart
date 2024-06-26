import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/commons/images.dart';
import 'package:food_app/commons/lottie.dart';
import 'package:food_app/commons/setSearchParam.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/feature/streamCategoryApp/controller/categoryApp_controller.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/model/category_model.dart';
import 'package:food_app/model/itemApp_model.dart';
import 'package:food_app/feature/streamCategoryApp/screen/favourite_page.dart';
import 'package:food_app/feature/streamCategoryApp/screen/selected_item_page.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../main.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

List cart = [];

class _HomePageState extends ConsumerState<HomePage> {
  int? selectedIndex;
  String categoryId="";
  String itemImage="";
  bool view=true;
  List fav=[];
  List favourite=[];


  getFav() async {
    var data=await FirebaseFirestore.instance.collection("Users").doc(currentUserModel!.id).get();
    Map favData=data.data()!;
    favourite=favData["Fav"];
    for(int i=0;i<favourite.length;i++){
      fav.add(favourite[i]["ItemId"]);
    }
    setState(() {

    });
  }


  int dataCount=0;
  int currentIndex=0;

  // docEmpty(){
  //   StreamBuilder<QuerySnapshot>(
  //     stream: FirebaseFirestore.instance.collection("Categories").snapshots(),
  //     builder: (context, snapshot) {
  //       var data=snapshot.data!.docs;
  //       return ListView.separated(
  //         physics: BouncingScrollPhysics(),
  //         itemCount: data.length,
  //         scrollDirection: Axis.horizontal,
  //         shrinkWrap: true,
  //         itemBuilder: (context, index) {
  //           return  Container(
  //             height: h*0.32,
  //             width: w*0.5,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(w*0.05),
  //               color: colors.White,
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     margin: EdgeInsets.only(top: w*0.03,left: w*0.025),
  //                     height: h*0.15,
  //                     width: w*0.35,
  //                     // color: Colors.green,
  //                     child: Image(image: NetworkImage(data[index]["ItemImage"]),fit: BoxFit.cover,),
  //                   ),
  //                   // SizedBox(height: h*0.01,),
  //                   Text(data[index]["ItemName"],style: TextStyle(
  //                       fontWeight: FontWeight.w700
  //                   ),),
  //                   Text(data[index]["itemDescription"],style: TextStyle(
  //                       fontSize: w*0.026
  //
  //                   ),),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           SvgPicture.asset(IconConst.star),
  //                           SizedBox(width: w*0.01,),
  //                           Text("4+")
  //                         ],
  //                       ),
  //                       SizedBox(width: w*0.23,),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  //         }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.03,); },);
  //     }
  //   );
  // }



  // ifDocEmpty(){
  //   return  ref.watch(streamEmptyDocProvider).when(data: (data) {
  //     return ListView.separated(
  //       physics: BouncingScrollPhysics(),
  //       itemCount: 1,
  //       scrollDirection: Axis.horizontal,
  //       shrinkWrap: true,
  //       itemBuilder: (context, index) {
  //         return  Container(
  //           height: h*0.32,
  //           width: w*0.5,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(w*0.05),
  //             color: colors.White,
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   margin: EdgeInsets.only(top: w*0.03,left: w*0.025),
  //                   height: h*0.15,
  //                   width: w*0.35,
  //                   // color: Colors.green,
  //                   child: Image(image: NetworkImage(data[index].ItemImage),fit: BoxFit.cover,),
  //                 ),
  //                 // SizedBox(height: h*0.01,),
  //                 Text(data[index].ItemName,style: TextStyle(
  //                     fontWeight: FontWeight.w700
  //                 ),),
  //                 Text(data[index].ItemDescription,style: TextStyle(
  //                     fontSize: w*0.026
  //
  //                 ),),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         SvgPicture.asset(IconConst.star),
  //                         SizedBox(width: w*0.01,),
  //                         Text("4+")
  //                       ],
  //                     ),
  //                     SizedBox(width: w*0.23,),
  //                     GestureDetector(
  //                         onTap: () {
  //                           if(food[0]["fav"].contains(index)){
  //                             food[0]["fav"].remove(index);
  //                             getFun(food[index], false);
  //                           }else{
  //                             food[index]["fav"].add(index);
  //                             getFun(food[index], true);
  //                           }
  //                           setState(() {
  //                           });
  //                           // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePage(),));
  //                         },
  //                         child:SvgPicture.asset( IconConst.heart,height: w*0.05,width: w*0.05,color: food[index]["fav"].contains(index)? colors.Red:colors.Black,)),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.03,); },);
  //   }, error: (error, stackTrace) => Center(child: Text("error")), loading: () => CircularProgressIndicator());
  // }

  randomId() async {
    var name= await FirebaseFirestore.instance.collection("Categories").get();
    categoryId = name.docs.isNotEmpty ? name.docs[0].id : "";
    selectedIndex=0;
    setState(() {

    });
  }


  streamCategoryFunc(){
    return ref.watch(streamDataProvider).when(
      data: (data) {
        return ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    categoryId = data[index].id;
                    selectedIndex=index;
                    setState(() {});
                  },
                  child: Container(
                    height: h * 0.14,
                    width: w * 0.23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(w * 0.19),
                            bottom: Radius.circular(w * 0.19)),
                        border: Border.all(
                          // color: colors.Green
                            color: selectedIndex == index ? colors.PrimaryColour : Colors.grey.shade400
                        )
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: w * 0.02,
                          left: w * 0.024,
                          child: Container(
                            height: h * 0.12,
                            width: w * 0.18,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(
                                    data[index].image),
                                  fit: BoxFit.cover,
                                ),
                                // color: selectedIndex == index ? colors.PrimaryColour.withOpacity(0.7) : colors.Green.withOpacity(0.1),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(w * 0.19),
                                    bottom:
                                    Radius.circular(w * 0.19))),
                          ),
                        ),
                      ],
                    ),

                  ),

                ),
                Text(data[index].category,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: w*0.03
                ),),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: w * 0.03,
            );
          },
          itemCount: data.length,
        );
      },
      error: (err, stack) => Text("Please"),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  streamItems(){
    return ref.watch(streamItemsProvider(categoryId)).when(data: (data) {
      print("screen ----------------------- ${categoryId}");
      return  Column(
          children: [
            // ElevatedButton(onPressed: ()async{
            //   var data = await FirebaseFirestore.instance.collection("Categories").get();
            //
            //       // .collectionGroup('Subitems').get();
            //   print(data.docs.length);
            //   for(var docs in data.docs){
            //     // print(docs['ItemName']);
            //
            //     FirebaseFirestore.instance.collection("Categories").doc(docs['id']).update(
            //
            //         // .collection('Subitems').doc(docs['ItemId'])
            //
            //       {
            //         'search':setSearchParam(
            //             docs['category']
            //
            //
            //         )
            //       }
            //     );
            //
            //   }
            // }, child: Text("se")),
            view==true? Expanded(
              child: Container(
                height: h*1,
                // color: Colors.red,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return  Container(
                      height: h*0.5,
                      width: w*0.5,
                      margin: EdgeInsets.all(w*0.03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.05),
                          color: colors.White,
                          boxShadow: [
                            BoxShadow(
                                color: colors.PrimaryColour.withOpacity(0.15),
                                offset: Offset(0, 4),
                                blurRadius:4,
                                spreadRadius: 2
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,CupertinoPageRoute(builder: (context) => SelectedItemPage(selectedItem: data[index], CategoryId: categoryId,),));
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top: w*0.03,left: w*0.025),
                              height: h*0.22,
                              width: w*0.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(data[index].ItemImage),fit: BoxFit.cover,),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.03),topRight: Radius.circular(w*0.03))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(w*0.02),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(IconConst.star),
                                            SizedBox(width: w*0.01,),
                                            Text("4+",style: TextStyle(
                                                color: colors.White
                                            ),),
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              if(fav.contains(data[index].itemId)){
                                                fav.remove(data[index].itemId);
                                                print(favourite);
                                                favourite.removeWhere((element) => element["ItemId"]==data[index].itemId);
                                                FirebaseFirestore.instance.collection("Users").doc(currentUserModel!.id).update({
                                                  "Fav":favourite
                                                });
                                                setState(() {

                                                });
                                              }else{
                                                fav.add(data[index].itemId);
                                                favourite.add(data[index].toMap());
                                                FirebaseFirestore.instance.collection("Users").doc(currentUserModel!.id).update({
                                                  "Fav":FieldValue.arrayUnion(favourite)
                                                });
                                              }
                                              setState(() {
                                              });
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePage(),));
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePage(),));
                                            },
                                            child:SvgPicture.asset(fav.contains(data[index].itemId) ? IconConst.heart : IconConst.heart_outLine,height: w*0.05,width: w*0.05,color: colors.White,)),
                                        // Text(data.length.toString())
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: h*0.01,),
                          Text(data[index].ItemName,style: TextStyle(
                              fontWeight: FontWeight.w700
                          ),),
                          Expanded(
                            child: Text(data[index].ItemDescription,style: TextStyle(
                                fontSize: w*0.026
                            ),),
                          ),
                          Text(
                            "₹ ${data[index].ItemPrice.toString()}",style: TextStyle(fontSize: w*0.035,fontWeight: FontWeight.w600),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: w*0.23,),

                            ],
                          )
                        ],
                      ),
                    );
                  },
                  // separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.03,); },
                ),
              ),
            ): Expanded(
              child: ListView.separated(
                itemCount: data.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext , index) {
                  return SizedBox(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectedItemPage(selectedItem: data[index], CategoryId: categoryId,),));
                      },
                      child: Container(
                        height: w*0.4,
                        width: w*0.9,
                        decoration: BoxDecoration(
                            color: colors.White,
                            borderRadius: BorderRadius.circular(w*0.03)
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w*0.03),
                              height: w*0.3,
                              width: w*0.3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(data[index].ItemImage),fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(w*0.03)
                              ),
                            ),
                            SizedBox(width:w*0.02),
                            SizedBox(
                              width: w*0.55,
                              // color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data[index].ItemName,
                                    style: TextStyle(
                                        fontSize: w*0.035,
                                        fontWeight: FontWeight.w700
                                    ),),
                                  // SizedBox(height: w*0.05,),
                                  Text(data[index].ItemDescription,
                                    style: TextStyle(
                                        fontSize: w*0.03,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  Text(
                                    "₹ ${data[index].ItemPrice.toString()}",style: TextStyle(fontSize: w*0.035,fontWeight: FontWeight.w600),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(IconConst.star),
                                          SizedBox(width: w*0.01,),
                                          Text("4+")
                                        ],
                                      ),
                                      SizedBox(width: w*0.23,),
                                      InkWell(
                                          onTap: () {
                                            if(fav.contains(data[index].itemId)){
                                              fav.remove(data[index].itemId);
                                              print("---------------------dcrtfvbgynhum--------------------jik,opl.[;/");
                                              print(favourite);
                                              print("---------------------dcrtfvbgynhum--------------------jik,opl.[;/");
                                              print(data[index].itemId);

                                              favourite.removeWhere((element) => element["ItemId"]==data[index].itemId);
                                              FirebaseFirestore.instance.collection("Users").doc(currentUserModel!.id).update({
                                                "Fav":favourite
                                              });
                                              setState(() {

                                              });
                                            }else{
                                              fav.add(data[index].itemId);
                                              favourite.add(data[index].toMap());
                                              FirebaseFirestore.instance.collection("Users").doc(currentUserModel!.id).update({
                                                "Fav":FieldValue.arrayUnion(favourite)
                                              });
                                            }
                                            setState(() {
                                            });
                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePage(),));
                                          },
                                          child:SvgPicture.asset(fav.contains(data[index].itemId) ? IconConst.heart : IconConst.heart_outLine,height: w*0.05,width: w*0.05,)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: w*0.03,); },
              ),
            )]);

    },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: Lottie.asset(lottieConst.loading)));
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

  String? name;


  @override
  void didChangeDependencies() {
    streamCategoryFunc();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getFav();
    randomId();


    // TODO: implement initState
    super.initState();
  }

  // favouriteFun() async {
  //   var favouriteUser= await FirebaseFirestore.instance.collection("Users").doc(userEmail).get();
  //   var favItem= await FirebaseFirestore.instance.collection("Subitems").doc(widget.).get();
  //
  //
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.Background,
        body: Padding(
          padding: EdgeInsets.all(w * 0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: AnimationLimiter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children:
                  [

                    StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                        stream: FirebaseFirestore.instance.collection("Banner").snapshots(),
                        builder: (context, snapshot) {


                          if(!snapshot.hasData){

                            return Center(child: CircularProgressIndicator());

                          }
                          var data=snapshot.data!.docs;

                          return Column(
                            children: [
                              CarouselSlider.builder(
                                itemCount: data.length,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: 0.8,
                                  enlargeCenterPage: true,
                                  autoPlayAnimationDuration: Duration(
                                    // milliseconds: 500,
                                      seconds: 2
                                  ),
                                  onPageChanged: (index, reason) {
                                    currentIndex=index;
                                    setState(() {

                                    });
                                  },
                                ),
                                itemBuilder:(context, index, realIndex) {
                                  return Container(
                                    margin: EdgeInsets.only(right: w*0.01),
                                    height: h*0.4,
                                    width: w*1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w*0.03),
                                      image: DecorationImage(image: NetworkImage(data[index]["image"]),fit: BoxFit.fill),
                                      // color: Colors.red,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Colors.black.withOpacity(0.15),
                                      //       blurRadius:2,
                                      //       spreadRadius: 2,
                                      //       offset: Offset(
                                      //           0,4
                                      //       )
                                      //   ),
                                      // ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: h*0.01),
                              Center(
                                child: AnimatedSmoothIndicator(
                                  activeIndex: currentIndex,
                                  count: data.length,
                                  effect: JumpingDotEffect(
                                    dotColor: Colors.grey,
                                    activeDotColor: colors.PrimaryColour,
                                    dotHeight: w*0.02,
                                    dotWidth: w*0.02,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                    ),
                    SizedBox(height: h*0.02),
                    Text(
                      "ENJOY DELICIOUS FOOD",
                      style: TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: w * 0.03,
                    ),
                    SizedBox(
                        height: h * 0.17,
                        width: w * 1,
                        child: streamCategoryFunc()
                    ),
                    SizedBox(
                      height: h* 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular restaurants",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: w * 0.037),
                        ),
                        GestureDetector(
                          onTap:() {
                            view=!view;
                            setState(() {
                            });
                            print("--------------------------------------------");
                            print(view);
                          },
                          child: Text(
                            "View all ",
                            style: TextStyle(color: colors.Red, fontSize: w * 0.03),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    SizedBox(
                        height: view?h*0.34: h * 0.64,
                        width: w * 1,
                        // color: Colors.red,
                        child:streamItems()
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
