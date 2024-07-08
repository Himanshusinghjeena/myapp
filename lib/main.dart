// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/screens/api.dart';
import 'package:myapp/screens/bottom_navigation.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/screens/welcome_screen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
     
      home:   BottomNavigation(),
    );
  }
}
