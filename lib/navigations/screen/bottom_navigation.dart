import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/commons/icons.dart';
import 'package:food_app/model/category_model.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:food_app/model/itemApp_model.dart';
// import 'package:food_app/navigations/screen/your_cart_page.dart';
import 'package:food_app/on_body/screen/search_page.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../main.dart';
import '../../feature/streamCategoryApp/screen/cart_page.dart';
import '../../feature/streamCategoryApp/screen/favourite_page.dart';
import 'notification_page.dart';


class NavigationPage extends StatefulWidget {
  final int bottomIndex;
  const NavigationPage({super.key,required this.bottomIndex});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}


class _NavigationPageState extends State<NavigationPage> {




  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;

  bool isDrawerOpen=false;

  int selectIndex=0;

  List pages=[
    HomePage(),
    FavouritePage(a: cart ,),
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
      // title: 'Cart',
    ),
  ];

  Position ?_currentLocation;
  late bool servicePermission=false;
  late  LocationPermission permission;
  String _currentAdress ="";
  Future<Position> _getCurrentLocation() async {
    servicePermission =await Geolocator.isLocationServiceEnabled();
    if(!servicePermission){

    }
    permission=await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission =await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }
  _getAddressFromCoordinates() async{
    try{
      List<Placemark> placemark =await placemarkFromCoordinates(_currentLocation!.latitude, _currentLocation!.longitude);
      Placemark place = placemark[0];
      setState(() {
        _currentAdress ="${place.locality},${place.country}";
      });
    }catch (e){

    }
  }

  fetch()async{
    _currentLocation =await _getCurrentLocation();
    await _getAddressFromCoordinates();
    setState((){

        });
    }
  @override
  void initState() {
    selectIndex=widget.bottomIndex;
    fetch();
    // _determinePosition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues( xOffset, yOffset, 0)..scale(scaleFactor),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colors.Background,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: isDrawerOpen?GestureDetector(
              onTap: () {

                xOffset=0;
                yOffset=0;
                scaleFactor=1;
                isDrawerOpen=false;
                setState(() {

                });


              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8,bottom: 4),
                child: Container(
                  height: h*0.07,
                  width: w*0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),

                    border: Border.all(  color: colors.lightgrey,
                    )
                  ),

                  child: Center(
                    child: SvgPicture.asset(
                      IconConst.leftArrow,
                    ),
                  ),
                ),
              ),
            ):GestureDetector(
              onTap: () {


                xOffset=250;
                yOffset=150;
                scaleFactor=0.6;
                isDrawerOpen=true;

                setState(() {

                });

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: w*0.02,
                  width: w*0.02,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),

                      border: Border.all( color: colors.lightgrey,)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      IconConst.drawerr,

                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Column(
            children: [
              InkWell(
                onTap: () {
                  // _determinePosition();

                },
                child: Text(
                  "Delivery to",
                  style: TextStyle(color: colors.Black, fontSize: w * 0.03),
                ),
              ),
              Text(
                _currentAdress.isNotEmpty?_currentAdress:("Location"),

                // _position != null?("Current Location"+_position.toString()):("no Location data"),
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
                backgroundImage: NetworkImage(userImg)  ,
              ),
            ),
            SizedBox(
              width: w * 0.03,
            ),
          ],
        ),
        backgroundColor: colors.Background,
        body: pages[selectIndex],
        bottomNavigationBar:
        Stack(
          children: [
            Positioned(
              top: w*0.03,
              child: CircleAvatar(
                radius: w*0.04,
                backgroundColor: Colors.red,
              ),
            ),
            BottomBarInspiredInside(
              items: items,
              backgroundColor: colors.White,
              color: colors.PrimaryColour,
              colorSelected: colors.White,
              indexSelected: selectIndex,
              onTap: (int index) => setState(() {
                selectIndex = index;
              }),
              chipStyle: ChipStyle(
                  convexBridge: true,
                  background: colors.PrimaryColour
              ),
              itemStyle: ItemStyle.circle,
              animated: true,
            ),
          ],
        ),
      ),
    );
  }
}
