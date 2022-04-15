import 'package:firebase_basic/persons/persons.dart';
import 'package:firebase_basic/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Basics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PersonsPage(),
      initialRoute: '/',
      routes: {
        '/persons':(context) => const PersonsPage(),
        '/profile':(context) => const ProfilePage()
      },
    );
  }
}