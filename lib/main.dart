import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_auth_app/widgets/languages.dart';
import 'package:flutter_phone_auth_app/pages/sign_in.dart';
import 'package:flutter_phone_auth_app/widgets/wave.dart';
import 'package:flutter_phone_auth_app/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBsZpWcJ_lYjyKyMIEutoM5Ojin5EiGcNc", // Your apiKey
      appId: "1:441751168390:android:d13057a6f6358847e6f807", // Your appId
      messagingSenderId: "441751168390", // Your messagingSenderId
      projectId: "phone-auth-b4ec0",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
