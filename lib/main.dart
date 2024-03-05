import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/auth/screen/create_account.dart';
import 'package:food_app/auth/screen/login_account.dart';
import 'package:food_app/commons/colours.dart';
import 'package:food_app/on_body/screen/onbord_screen.dart';
import 'package:food_app/splash/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'on_body/screen/home_page.dart';

var w;
var h;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
      home:  HomePage(),
    );
  }
}

