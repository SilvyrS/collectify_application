import 'package:flutter/material.dart';
import 'aboutUsScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collectify Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutUs(),
      debugShowCheckedModeBanner: false,
    );
  }
}
