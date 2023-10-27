import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cyclone_v1/features/splashscreen/screens/splash_screen.dart';
import 'package:cyclone_v1/features/onboarding/presenter/screens/onboard_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();


  if(kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCOAdogtCQzAItbr573lOt2QQRsT3BF80Y", 
        appId: "1:925635400314:web:648b3389f601f1c0daa1c3", 
        messagingSenderId: "925635400314", 
        projectId: "cocylce-app"
      )
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        child: OnboardingScreen(),
      ),
    );
  }
}
