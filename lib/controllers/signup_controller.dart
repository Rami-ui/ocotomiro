import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/inventory_list_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SignupController {


  static Future<void> createAccount(BuildContext context,String email, String password, String fullName, String phoneNumber) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    var userId=FirebaseAuth.instance.currentUser!.uid;

    try {

    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'userId': userId,
    });
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }

    // You can also save additional user information to Firestore or Realtime Database here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign up successful')),
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) {
        return InventoryListScreen();
      }),
      (Route<dynamic> route) => false,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('The password provided is too weak.')),
      );
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('The account already exists for that email.')),
      );
    }
  } 
  // catch (e) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('An error occurred. Please try again.')),
  //   );
  // }
}


}