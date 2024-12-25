import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/inventory_list_screen.dart';
import 'package:ocotomiro/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userForm = FirebaseAuth.instance.currentUser;
  @override
  void initState(){

//check if user is logged in
Future .delayed(Duration(seconds: 3),(){
  if(userForm != null){
    openinventorylistscreen();
  }else{
    openloginscreen();
  }
});



    super.initState();
  }
  void openinventorylistscreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return InventoryListScreen();
      })
    );
  }



  void openloginscreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LoginScreen();
    })
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        SizedBox(
          height: 800,
          width: 800,
          child: Image.asset("assets/images/logo1.png"),
        )
        )
    );
  }
}