//import 'dart:html';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:minor/home_page.dart';
import 'package:minor/Pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'package:minor/register_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,//use MaterialApp() widget like this
        home: SplashScreen()
    );
  }
}

