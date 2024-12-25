import 'package:flutter/material.dart';
import 'package:ocotomiro/controllers/signup_controller.dart';
import 'package:ocotomiro/screens/login_screen.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => __SingupScreenState();
}

class __SingupScreenState extends State<SignupScreen> {
  var userForm = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userForm,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 100,),
                        SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Image.asset("assets/images/logo2.png")
                        ),
                        SizedBox(height: 30,),
                        CustomTextField(
                          controller: fullname,
                          hintText: "Full Name",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: phone,
                          hintText: "Phone Number",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: email,
                          hintText: "Email",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: Password,
                          hintText: "Password",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: Password,
                          hintText: "Password confirmation",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: (){
                            if(userForm.currentState!.validate()){
                              //register user
                              SignupController.createAccount(context,email.text,Password.text,fullname.text,phone.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(187, 20, 75, 82), // Set the background color to green
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              )
                            ),
                           child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                        ),
                         SizedBox(height: 20,),
                        Text("You have an account?",style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextEditingController controller;

  CustomTextField({required this.controller,required this.hintText,required this.obscureText,required this.enableSuggestions,required this .autocorrect});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    controller: controller,
        validator: (value){
                  if(value!.isEmpty){
                    return hintText + " is required";
                  }
                  else if(hintText == "Email" && !value.contains("@")) 
                  {
                    return "Invalid email";
                  }
                  else if (hintText == "Password" && value.length < 6)
                  {
                    return "Password must be at least 6 characters";
                  }
                   else if (hintText == "Phone Number" && !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Phone Number must contain only digits";
                  }
                  else if (hintText == "Phone Number" && value.length < 8) {
                    return "Phone Number must be at least 8 digits";
                  }
                  // else if (hintText == "Password confirmation" && value != userForm.currentState?.fields['Password']?.value) {
                  //   return "Passwords do not match";
                  // }

                  return null;
                },
                obscureText: obscureText,
                enableSuggestions: enableSuggestions,
                autocorrect: autocorrect,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Color(0xFFEFEFF4),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
