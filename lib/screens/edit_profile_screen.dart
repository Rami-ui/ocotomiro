import 'package:flutter/material.dart';
import 'package:ocotomiro/providers/userProvider.dart';
import 'package:ocotomiro/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditeProfileScreenState();
}

class _EditeProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    nameController.text = userProvider.userName;
    emailController.text = userProvider.userEmail;
    phoneController.text = userProvider.userPhone;
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Profile',style: TextStyle(fontWeight: FontWeight.bold,color:  const Color(0xBC22656e),fontFamily: "Poppins",fontSize: 19)
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
        body: Column(
          
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
            
            
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Save'),
            ),
          ]
        )
    );
  }
}