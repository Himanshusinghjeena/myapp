// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:myapp/screens/recent.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/screens/splashScreen.dart';
// import 'package:myapp/screens/welcome_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   SplashScreen(),
    );
  }
}
