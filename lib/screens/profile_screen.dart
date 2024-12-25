import 'package:flutter/material.dart';
import 'package:ocotomiro/providers/userProvider.dart';
import 'package:ocotomiro/screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,color:  const Color(0xBC22656e),fontFamily: "Poppins",fontSize: 19)
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      
        body: Column(
          
          children: [
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 30,
                child: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 15),
            Text(userProvider.userName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: const Color.fromARGB(187, 0, 0, 0),fontFamily: "Poppins")),
            Text(userProvider.userEmail,style: TextStyle(fontSize: 20,color: const Color.fromARGB(187, 0, 0, 0),fontFamily: "Poppins")),
            
            
            SizedBox(height: 20),

            SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return EditProfileScreen();
                              }),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(187, 20, 75, 82), // Set the background color to green
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              )
                            ),
                           child: Text("Edit Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                        ),
          
          ]
        )
    );
  }
}