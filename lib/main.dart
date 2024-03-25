import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:food_app/auth/screen/create_account.dart';
import 'package:food_app/auth/screen/delivery_method.dart';
import 'package:food_app/auth/screen/edit_profile.dart';
import 'package:food_app/auth/screen/forget_password.dart';
// import 'package:food_app/auth/screen/login_account.dart';
import 'package:food_app/auth/screen/orders_page.dart';
// import 'package:food_app/auth/screen/payment_page.dart';
import 'package:food_app/auth/screen/reset_password.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/feature/auth/screen/login_account.dart';
import 'package:food_app/on_body/screen/onbord_screen.dart';
import 'package:food_app/on_body/screen/selected_item_page.dart';
import 'package:food_app/on_body/screen/utube/drawer_screen.dart';
import 'package:food_app/on_body/screen/utube/homepage_utube.dart';
import 'package:food_app/on_body/screen/your_cart_page.dart';
import 'package:food_app/splash/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'on_body/screen/bottom_navigation.dart';
import 'on_body/screen/curve_page.dart';
import 'on_body/screen/home_page.dart';

var w;
var h;





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;

    return MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:GoogleFonts.dmSansTextTheme(),
      ),
      home:  HomePageUtube()
    );
  }
}

