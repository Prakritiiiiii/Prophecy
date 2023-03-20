import 'package:flutter/material.dart';
import 'package:minor/Authorization/login.dart';
import 'package:minor/Authorization/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  // first login page is shown
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage= !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LogInPage(showRegisterPage:toggleScreens);
    }
    else{
      return RegisterPage(showLogInPage:toggleScreens );
    }
  }
}
