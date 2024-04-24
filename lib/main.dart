import 'package:flutter/material.dart';
import 'package:orkut/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        fontFamily: 'poppins',
        scaffoldBackgroundColor: Colors.grey.shade200,
        primaryColor: Colors.black,
        focusColor: Colors.black,
        indicatorColor: Colors.black,
        hoverColor: Colors.black,


      ),

      home: Login(),
    );
  }
}
