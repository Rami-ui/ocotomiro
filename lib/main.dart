import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ocotomiro/firebase_options.dart';
import 'package:ocotomiro/providers/userProvider.dart';
import 'package:ocotomiro/screens/splash_screen.dart';
import 'package:provider/provider.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
    
    create: (context) => UserProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
        home:SplashScreen(),

      );
  }
}

