import 'package:google_fonts/google_fonts.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:minor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minor/Authorization/forgot%20Password.dart';
//import 'package:minor/Authorization/register_page.dart';

class LogInPage extends StatefulWidget{
  final VoidCallback showRegisterPage;

  const LogInPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final emailRegex = RegExp(r'^[a-zA-Z0-9.!#$%&\*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

  // String validateEmail(String value) {
  //   if (value.isEmpty) {
  //     return 'Please enter an email address.';
  //   } else if (!emailRegex.hasMatch(value)) {
  //     return 'Please enter a valid email address.';
  //   }
  //   return 'null';
  // }

  Future signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }on FirebaseAuthException catch(e) {
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
  @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person_2_rounded,
                  size:100,
                ),
                const SizedBox(height:75),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(height:10),
                const Text(
                  'Explore the world of predictions!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height:50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  //  validator: validateEmail,
                  ),
                ),
                const SizedBox(height:10),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height:10),

                Padding(
                  padding : const EdgeInsets.symmetric(horizontal: 25.0),
                  child : Row(
                    mainAxisAlignment : MainAxisAlignment.end,
                    children :[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return ForgotPasswordPage();
                }));
                },
                        child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF01579B),
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                  ],
                  ),
                ),

                const SizedBox(height: 10),
                //signin button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[800],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(
                          //color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        ' Register now',
                        style: TextStyle(
                            color: Color(0xFF01579B),
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )

              ],
            )
          )
         ),
        ),
      );
  }
}