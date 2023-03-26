import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:minor/Authorization/auth_page.dart';
//import 'package:minor/Authorization/login.dart';
//import 'package:minor/Authorization/register_page.dart';
import 'package:minor/Pages/splash_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey = GlobalKey<FormState>();
  var newPassword = '';
  //var oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    newPasswordController.dispose();
    //oldPasswordController.dispose();
    super.dispose();
  }

  changePassword() async{
    try{
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SplashScreen(),
      ),
    );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black26,
          content: Text("Your Password has been changed. Log in Again !"),
      ),
      );
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text("Your Password has been changed. Log in Again !"),
      ),
      );
    }
  }
  @override

  Widget build(BuildContext context) {
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
                      'Change Password',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 52,
                      ),
                    ),
                    const SizedBox(height:10),
                    const Text(
                      'Its a good ng elsewhere',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),


                    /*const SizedBox(height:10),
                    //password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        obscureText: true,
                        controller: oldPasswordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Old Password',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),*/

                    const SizedBox(height:10),
                    //password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        obscureText: true,
                        controller: newPasswordController,
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

                    ElevatedButton(onPressed:(){
                      if(_formKey.currentState!.validate()){
                        //if(newPasswordController.text.trim()==oldPasswordController.text.trim())
                        setState(() {
                          newPassword = newPasswordController.text;
                        });
                        changePassword();
                      }
                    },

                      child: Text ("Save Changes",
                      style: TextStyle(fontSize: 18.0),
                      ),

                    ),
                  ],
                )
            )
        ),
      ),
    );
  }
}
