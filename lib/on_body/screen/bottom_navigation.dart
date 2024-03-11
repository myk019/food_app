import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/on_body/screen/home_page.dart';
import 'package:food_app/on_body/screen/search_page.dart';

import '../../main.dart';
import 'cart_page.dart';
import 'favourite_page.dart';
import 'notification_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}


class _BottomNavigationState extends State<BottomNavigation> {

  int selectIndex=0;
  List pages=[
    HomePage(),
    FavouritePage(),
    SearchPage(),
    NotificationPage(),
    CartPage()
  ];
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      // title: 'Home',
    ),
    TabItem(
      icon: Icons.favorite,
      // title: 'favourite',
    ),
    TabItem(
      icon: Icons.search,
      // title: 'search',
    ),
    TabItem(
      icon: Icons.notifications,
      // title: 'Notification',
    ),
    TabItem(
      icon: Icons.shopping_cart,
      title: 'Cart',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.Background,
      body: pages[selectIndex],
      bottomNavigationBar:
      BottomBarInspiredInside(
        // height: h*0.07,
        items: items,
        backgroundColor: colors.White,
        color: colors.PrimaryColour,
        colorSelected: Colors.white,
        indexSelected: selectIndex,
        onTap: (int index) => setState(() {
          selectIndex = index;
        }),
        chipStyle: ChipStyle(convexBridge: true),
        itemStyle: ItemStyle.circle,
        animated: true,
      ),
    );
  }
}
