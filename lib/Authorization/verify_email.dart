import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  @override
  void initState(){
    super.initState();
    isEmailVerified= FirebaseAuth.instance.currentUser!.emailVerified;
  }
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
