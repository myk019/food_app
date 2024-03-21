import 'package:flutter/material.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/images.dart';

import '../../main.dart';

class FavouritePage extends StatefulWidget {
  final List a;

  const FavouritePage({super.key, required this.a});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: widget.a.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                                image: AssetImage(widget.a[index]["image"]),
                                fit: BoxFit.cover)
                            // image: DecorationImage(image: image)
                            ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.a[index]["name"],
                            style: TextStyle(color: colors.Black),
                          ),
                          Text(widget.a[index]["name"]),
                          Text(widget.a[index]["price"].toString())
                        ],
                      ),
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: w*0.02,
                );
            },
            ),
          )
        ],
      ),
    );
  }
}
