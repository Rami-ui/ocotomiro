import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/splash_screen.dart';
class LoginController {


  static Future<void> login(
    {required BuildContext context,
    required String email,
    required String password} ) async {
      try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Log in successful')),
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }),
      (Route<dynamic> route) => false,
    );
  }on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not found for that email.')),
      );
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wrong password provided for that user.')),
      );
    }
  }

}
}