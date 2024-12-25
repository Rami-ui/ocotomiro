import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/inventory_list_screen.dart';
class LoginController {


  static Future<void> login(BuildContext context,String email, String password, String fullName, String phoneNumber) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // You can also save additional user information to Firestore or Realtime Database here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Log in successful')),
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) {
        return InventoryListScreen();
      }),
      (Route<dynamic> route) => false,
    );
  }  

  // catch (e) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('An error occurred. Please try again.')),
  //   );
  // }
}


