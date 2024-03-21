
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/commons/images.dart';
import 'package:food_app/on_body/screen/favourite_page.dart';
import 'package:food_app/on_body/screen/selected_item_page.dart';
import 'package:food_app/on_body/screen/utube/drawer_screen.dart';

import '../../main.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List cart=[];

class _HomePageState extends State<HomePage> {

  int? selectedIndex;


  List items=[
    {
      "image":"assets/images/🍔.png",
      "name":"Pizza",
    },
    {
      "image":"assets/images/🍔.png",
      "name":"Burger",


    },
    {
      "image":"assets/images/🍔.png",
      "name":"sausage",


    },
    {
      "image":"assets/images/🍔.png",
      "name":"Samoli",


    },
  ];



getFun(Map<String,dynamic>map,bool status){
  status==true? cart.add(map):cart.remove(map);
}

  List food=[
    {
      "image":"assets/images/Burger.png",
      "name":"Big cheese burger",
      "description":"No 10 opp lekki phase 1 bridge in\nsangotedo estate",
      "price":150,
      "fav":[]
    },
    {
      "image":"assets/images/Burger.png",
      "name":" Double cheese Burger",
      "description":"No 10 opp lekki phase 1 bridge in\nsangotedo estate",
      "price":150,
      "fav":[]
    },
    {
      "image":"assets/images/Burger.png",
      "name":"Mini burger",
      "description":"No 10 opp lekki phase 1 bridge in\nsangotedo estate",
      "price":150,
      "fav":[]
    },
    {
      "image":"assets/images/Burger.png",
      "name":"Hot Burger",
      "description":"No 10 opp lekki phase 1 bridge in\nsangotedo estate",
      "price":150,
      "fav":[]
    },
  ];



  // final _drawerController = AwesomeDrawerBarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      // appBar: AppBar(
      //   backgroundColor: colors.Background,
      //   elevation: 0,
      //   leading: GestureDetector(
      //     onTap: () {
      //
      //
      //        Navigator.push(context, CupertinoPageRoute(builder: (context) => HiddenDrawerPage(),));
      //     },
      //     child: SizedBox(
      //       height: w*0.5,
      //       width: w*0.5,
      //       // color: Colors.red,
      //       child: Image(image: AssetImage(ImageConst.drawer))
      //     ),
      //   ),
      //   title: Column(
      //     children: [
      //       Text("Delivery to",style: TextStyle(
      //         color: colors.Black,
      //         fontSize: w*0.03
      //       ),),
      //       Text("lekki phase 1, Estate",style: TextStyle(
      //           color: colors.Red,
      //           fontSize: w*0.03
      //       ),)
      //     ],
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     SizedBox(
      //       height: w*0.12,
      //       width: w*0.12,
      //       // color: colors.Red,
      //       child: CircleAvatar(
      //         radius: w*0.02,
      //         backgroundColor: colors.White,
      //         child: SvgPicture.asset(IconConst.googleIcon),
      //                    ),
      //     ),
      //     SizedBox(width: w*0.03,),
      //   ],
      //
      // ),
      body: Padding(
        padding: EdgeInsets.all(w*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enjoy Delicious food",style: TextStyle(
              fontSize: w*0.05,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: w*0.05,),
            SizedBox(
              height: h*0.16,
              width: w*1,
              // color: Colors.red,
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                 return GestureDetector(
                   onTap: () {
                     selectedIndex=index;
                     setState(() {

                     });
                   },
                   child: Container(
                        height: h*0.33,
                        width: w*0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(w*0.19),bottom: Radius.circular(w*0.19)),
                            border: Border.all(color: selectedIndex==index?colors.Green:colors.lightgrey.withOpacity(0.5))
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: w*0.043,
                              left:w*0.034 ,
                              child: Container(
                                height: h*0.12,
                                width: w*0.18,
                                decoration: BoxDecoration(
                                  color: selectedIndex==index?colors.Green.withOpacity(0.2):colors.lightgrey.withOpacity(0.05),
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(w*0.19),bottom: Radius.circular(w*0.19))
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child:
                                  Container(
                                    height: h*0.05,
                                    width: w*0.11,
                                    // color: Colors.red,
                                    child: Image(image: AssetImage(items[index]["image"]),fit: BoxFit.cover,),
                                  ),
                                ),
                                Text(items[index]["name"])
                              ],
                            ),

                          ],
                        )
                    ),
                 );
                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.03,); }, itemCount: items.length,
              ),
            ),
            SizedBox(
              height: h*0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular restaurants",style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: w*0.037
                ),),
                Text("View all(29)",style: TextStyle(
                  color: colors.Red,
                    fontSize: w*0.03
                ),)
              ],
            ),
            SizedBox(
              height: h*0.05,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectedItemPage(),));
              },
              child: SizedBox(
                height: h*0.34,
                width: w*1,
                // color: Colors.red,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: food.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                  return  Container(
                    height: h*0.32,
                    width: w*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.05),
                      color: colors.White,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: w*0.03,left: w*0.025),
                            height: h*0.15,
                            width: w*0.35,
                            // color: Colors.green,
                            child: Image(image: AssetImage(food[index]["image"]),fit: BoxFit.cover,),
                          ),
                          // SizedBox(height: h*0.01,),
                          Text(food[index]["name"],style: TextStyle(
                            fontWeight: FontWeight.w700
                          ),),
                          Text(food[index]["description"],style: TextStyle(
                              fontSize: w*0.026

                          ),),
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
                              GestureDetector(
                                onTap: () {
                                    if(food[index]["fav"].contains(index)){
                                      food[index]["fav"].remove(index);
                                       getFun(food[index], false);
                                    }else{
                                      food[index]["fav"].add(index);
                                       getFun(food[index], true);
                                    }
                                  setState(() {
                                  });
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePage(),));
                                },
                                  child:SvgPicture.asset( IconConst.heart,height: w*0.05,width: w*0.05,color: food[index]["fav"].contains(index)? colors.Red:colors.Black,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: w*0.03,); },),
              ),
            )
          ],
        ),
      ),
    );
  }
}
