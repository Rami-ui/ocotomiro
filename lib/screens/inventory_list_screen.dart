import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocotomiro/screens/profile_screen.dart';
import 'package:ocotomiro/screens/splash_screen.dart';
import 'detail_screen.dart';
import 'package:ocotomiro/models/inventory_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class InventoryListScreen extends StatefulWidget {
  @override
  _InventoryListScreenState createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  List<InventoryDocument> inventoryDocuments = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      inventoryDocuments = jsonData
          .map((data) => InventoryDocument.fromJson(data))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: const Color(0xBC22656e), // Set the color for the leading icon
        // ),
        // actionsIconTheme: IconThemeData(
        //   color: const Color(0xBC22656e),
        // ),
        //  leading: IconButton(
        //   icon: Icon(Icons.description), // Replace with the desired icon
        //   onPressed: () {
        //     // Add functionality here
        //   },
        // ),
        title: Text('Inventory Documents',style: TextStyle(fontWeight: FontWeight.bold,color:  const Color(0xBC22656e),fontFamily: "Poppins",fontSize: 19)
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
                  Navigator.pop(context);
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
                leading: Icon(Icons.people),
                title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                   Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ProfileScreen();
                    }),
                    (Route<dynamic> route) => false,
                  );
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
      body: ListView.builder(
        itemCount: inventoryDocuments.length,
        itemBuilder: (context, index) {
          final document = inventoryDocuments[index];
          return ListTile(
            title: Text(document.id,style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              document.date.toLocal().toString().split(' ')[0],style: _textStyle(),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(document: document),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
              child: Text('View Details',style: TextStyle(fontFamily: "Poppins",color: Colors.black,fontWeight: FontWeight.bold),),
            ),
          );
        },
      ),
    );
  }
    TextStyle _textStyle() {
    return TextStyle(fontSize: 14, color:const Color(0xBC22656e) );
  }
}
