//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
//
// class VerifyEmail extends StatefulWidget {
//   const VerifyEmail({Key? key}) : super(key: key);
//
//   @override
//   State<VerifyEmail> createState() => _VerifyEmailState();
// }
//
// class _VerifyEmailState extends State<VerifyEmail> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//
//   void sendOTP() async{
//     //EmailAuth.sessionName= 'Test Session';
//     EmailAuth emailAuth = new EmailAuth(sessionName: "TEst Session");
//     var res= await emailAuth.sendOtp(recipientMail:_emailController.text);
//     if(res){
//
//     }
//   }
//   void verifyOTP() {
//     EmailAuth emailAuth = new EmailAuth(sessionName: "verify Session");
//     var res = emailAuth.validateOtp(
//         recipientMail: _emailController.text,
//         userOtp:_otpController.text);
//     if(res){
//       ;
//     }
//     else{
//       print ("invalidate");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//           body: SafeArea(
//           child: Center(
//           child: SingleChildScrollView(
//           child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           const Icon(
//           Icons.person_2_rounded,
//           size:100,
//         ),
//         const SizedBox(height:75),
//         Text(
//         'Welcome Back',
//         style: GoogleFonts.bebasNeue(
//         fontSize: 52,
//         ),
//         ),
//         const SizedBox(height:10),
//         const Text(
//         'Explore the world of predictions!',
//         style: TextStyle(
//         fontSize: 18,
//         ),
//         ),
//         const SizedBox(height:50),
//         Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//     child: TextFormField(
//     controller: _emailController,
//     decoration: InputDecoration(
//     enabledBorder: OutlineInputBorder(
//     borderSide: const BorderSide(color: Colors.white),
//     borderRadius: BorderRadius.circular(12),
//     ),
//     focusedBorder: OutlineInputBorder(
//     borderSide: const BorderSide(color: Colors.deepPurple),
//     borderRadius: BorderRadius.circular(12),
//     ),
//     hintText: 'Email',
//     fillColor: Colors.grey[200],
//     filled: true,
//     ),
//     //  validator: validateEmail,
//     ),
//     ),
//
//     const SizedBox(height: 10),
//     //signin button
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//     child: GestureDetector(
//     onTap: sendOTP,
//     child: Container(
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//     color: Colors.lightBlue[800],
//     borderRadius: BorderRadius.circular(12),
//     ),
//     child: const Center(
//     child: Text(
//     'Sign In',
//     style: TextStyle(
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//     fontSize: 18,
//     ),
//     ),
//     ),
//     ),
//     ),
//     ),
//
//     const SizedBox(height:10),
//     //password textfield
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//     child: TextField(
//     obscureText: true,
//     controller: _otpController,
//     decoration: InputDecoration(
//     enabledBorder: OutlineInputBorder(
//     borderSide: const BorderSide(color: Colors.white),
//     borderRadius: BorderRadius.circular(12),
//     ),
//     focusedBorder: OutlineInputBorder(
//     borderSide: const BorderSide(color: Colors.deepPurple),
//     borderRadius: BorderRadius.circular(12),
//     ),
//     hintText: 'Password',
//     fillColor: Colors.grey[200],
//     filled: true,
//     ),
//     ),
//     ),
//
//     const SizedBox(height: 10),
//     //signin button
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//     child: GestureDetector(
//     onTap: verifyOTP,
//     child: Container(
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//     color: Colors.lightBlue[800],
//     borderRadius: BorderRadius.circular(12),
//     ),
//     child: const Center(
//     child: Text(
//     'Sign In',
//     style: TextStyle(
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//     fontSize: 18,
//     ),
//     ),
//     ),
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     ),
//     ),
//     );
//
//   }
// }
