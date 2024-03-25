import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/splash/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';


var w;
var h;
var userName;
var userEmail;
var userImg;






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
      home:  SplashScreen()
    );
  }
}

