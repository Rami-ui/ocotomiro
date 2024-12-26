import 'package:flutter/material.dart';
import 'package:ocotomiro/controllers/login_controller.dart';
import 'package:ocotomiro/screens/inventory_list_screen.dart';
import 'package:ocotomiro/screens/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => __LoginScreenState();
}

class __LoginScreenState extends State<LoginScreen> {
  var userForm = GlobalKey<FormState>();
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
                        SizedBox(height: 100,),
                        CustomTextField(
                          hintText: "Email",
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        
                          
                    
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hintText: "Password",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                         
                    
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Forgot Password?")),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: (){
                            if(userForm.currentState!.validate()){
                              LoginController.login(
                              context: context,
                              email:  email.text,
                              password:  Password.text,);
                              Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return InventoryListScreen();
                              }),
                              (Route<dynamic> route) => false,
                            );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(187, 20, 75, 82), // Set the background color to green
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              )
                            ),
                           child: Text("Log in",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                        ),
                         SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New user?",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 10),
                          
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupScreen()),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        ],
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

  CustomTextField({required this.hintText,required this.obscureText,required this.enableSuggestions,required this .autocorrect});
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value){
                  if(value!.isEmpty){
                    return hintText + " is required";
                  }
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
