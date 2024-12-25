import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/inventory_list_screen.dart';
import 'package:ocotomiro/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData = {};
  void getData(){
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((dataSnapshot){
      userData = dataSnapshot.data();
      setState(() {});
    });
    
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,color:  const Color(0xBC22656e),fontFamily: "Poppins",fontSize: 19)
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color(0xBC22656e),
                ),
                child: Text('Menu',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home',style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return InventoryListScreen();
                  }),
                  (Route<dynamic> route) => false,
                );
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About',style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('Contact',style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out',style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SplashScreen();
                    }),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Text(userData?["fullName"] ?? ""),
            Text(userData?["phoneNumber"] ?? ""),
            Text(userData?["email"] ?? ""),
          
          ]
        )
    );
  }
}