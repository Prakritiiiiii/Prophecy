import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password Reset link sent. Check your email!"),
            );
          }
      );
    } on  FirebaseAuthException catch (e) {
      //print(e);
      showDialog(
          context: context,
          builder: (context) {
           return AlertDialog(
            content: Text(e.message.toString()),
           );
         }
         );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],

      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),

        child :Column(

        children: [

          SizedBox(height:30),


          //email textfield
          Text('Enter your email and we will send you a password reset link',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF1f1545),
          )),
            SizedBox(height:25),


            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),


          SizedBox(height:10),

          MaterialButton(
              onPressed: passwordReset,
              child: Text ('Reset Password',
              style:TextStyle(
                  color: Colors.white
              )),
              color: Color(0xFF1f1545),
          ),
        ],

      ),
      ),
    );

  }
}
