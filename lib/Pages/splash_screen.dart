import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:minor/Authorization/main_page.dart';
import 'package:minor/Prediction/prediction_page.dart';
//import 'package:minor/Pages/hover_page.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    super.initState();
    Future.delayed(const Duration(seconds:3)).then((value){
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
              builder:(ctx) => const MainPage()
          )
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(
              image: AssetImage("assets/images/1.png"),
              width: 300,
            ),
            SizedBox(
              height : 50,
            ),
            SpinKitFadingCircle(
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}


