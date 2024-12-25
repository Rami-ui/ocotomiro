import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {


  String userName = '';
  String userEmail = '';
  String userPhone = '';
  String userId = '';

    void getData(){
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((dataSnapshot){
      userName = dataSnapshot.data()?['fullName'] ?? '';
      userEmail = dataSnapshot.data()?['email'] ?? '';
      userPhone = dataSnapshot.data()?['phoneNumber'] ?? '';
      userId = FirebaseAuth.instance.currentUser!.uid;
      notifyListeners();
    });
    
  } 

  }
  
