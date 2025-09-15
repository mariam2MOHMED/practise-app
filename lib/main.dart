import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practise/di/di.dart';
import 'package:practise/firebase_options.dart';
import 'package:practise/view/screens/create_user.dart';
import 'package:practise/view/screens/practise_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUp();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: createUserScreen(),
    );
  }
}
