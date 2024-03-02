import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/auth/screen/login_account.dart';
import 'package:food_app/on_body/screen/onbody_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:GoogleFonts.dmSansTextTheme()
      ),
      home:  LoginPage(),
    );
  }
}

