import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/commons/images.dart';

import '../../main.dart';

class YourCartPage extends StatefulWidget {
  const YourCartPage({super.key});

  @override
  State<YourCartPage> createState() => _YourCartPageState();
}

class _YourCartPageState extends State<YourCartPage> {


  int total=0;

  totalPrize(){
    total=0;
    for(int i=0;i<food.length;i++){
      total=food[i]["Qty"]*food[i]["price"]+total;
      setState(() {
      });
      print(total);
    }
  }


  List food=[
    {
      "image":"assets/images/Burger.png",
      "shope":"The Macdonalds",
      "name":"Big cheese burger",
      "price":23.99.toInt(),
      "Qty":0,
    },
    {
      "image":"assets/images/Burger.png",
      "shope":"The Macdonalds",
      "name":" Double Burger",
      "price":23.99.toInt(),
      "Qty":0,
    },
    {
      "image":"assets/images/Burger.png",
      "shope":"The Macdonalds",
      "name":"Mini burger",
      "price":23.99.toInt(),
      "Qty":0,
    },
    {
      "image":"assets/images/Burger.png",
      "shope":"The Macdonalds",
      "name":"Hot Burger",
      "price":23.99.toInt(),
      "Qty":0,
    },
  ];

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
            Text("Delivery to",style: TextStyle(
                color: colors.Black,
                fontSize: w*0.03
            ),),
            Text("lekki phase 1, Estate",style: TextStyle(
                color: colors.Red,
                fontSize: w*0.03
            ),)
          ],
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            height: w*0.12,
            width: w*0.12,
            // color: colors.Red,
            child: CircleAvatar(
              radius: w*0.02,
              backgroundColor: colors.White,
              child: SvgPicture.asset(IconConst.googleIcon),
            ),
          ),
          SizedBox(width: w*0.03,),
        ],

      ),
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
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: food.length,
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

                            },
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.red,
                            icon: Icons.delete,
                            label: "Delete",

                          )

                        ],
                      ),

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
                                image: DecorationImage(image: AssetImage(food[index]["image"]),fit: BoxFit.cover)
                                // image: DecorationImage(image: image)
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(food[index]["shope"].toString(),style: TextStyle(
                                    color: colors.Black
                                ),),
                                Text(food[index]["name"]),
                                Text(food[index]["price"].toString())
                              ],
                            ),
                            food[index]['Qty']!=0? SizedBox(
                              height: h*0.04,
                              width: w*0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      food[index]["Qty"]++;
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
                                  Text(food[index]["Qty"].toString()),
                                  GestureDetector(
                                    onTap: () {
                                      food[index]['Qty']<=0?0:food[index]['Qty']--;
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
                            ):GestureDetector(
                              onTap: () {
                                food[index]['Qty']++;
                                 totalPrize();
                                // additems( );
                                setState(() {

                                });
                              },
                              child: Container(
                                height: h*0.05,
                                width: w*0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w*0.03),
                                  color: colors.PrimaryColour,

                                ),
                                child: Center(child: Text("Add",style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) { return SizedBox(height: h*0.03,); },

                ),
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
