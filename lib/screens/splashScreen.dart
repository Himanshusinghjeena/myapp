// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;

  @override
  void initState() {
    super.initState();
    AnimationController animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = Tween(begin: 0.0, end: 150.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();

    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 0, 157, 255),
        child: Center(
          child: CircleAvatar(
            radius: animation.value,
            backgroundImage: AssetImage("assets/images/twitter-logo.png"),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
