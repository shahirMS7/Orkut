import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orkut/homepage.dart';
import 'package:orkut/login.dart';
import 'package:orkut/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  WidgetsBinding.instance!.renderView.automaticSystemUiAdjustment = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'poppins',
        scaffoldBackgroundColor: Colors.grey.shade200,
        primaryColor: Colors.black,
        focusColor: Colors.black,
        indicatorColor: Colors.black,
        // hoverColor: Colors.black,
      ),

      // home: Login(),
      home: HomePage()
    );
  }
}
