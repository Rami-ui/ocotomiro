import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){

//check if user is logged in
Future .delayed(Duration(seconds: 3),(){
openloginscreen();
});



    super.initState();
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