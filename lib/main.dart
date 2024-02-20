import 'package:flutter/material.dart';
import 'package:hungerhub/home.dart';
import 'package:hungerhub/registrationpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Fredoka'),
      home: const HomePage(),
    );
  }
}
