// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Image.asset('assets/images/bg-image.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity),
            Positioned(
              top:220,
              left: 10,
              right: 10,
              child: Container(
                child: Column(
                  children: [
                    Container(
                        child: Text(
                      "Welcome Back!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600),
                    )),
                    SizedBox(height: 20),
                    Container(
                        child: SafeArea(
                      top: false,
                      bottom: false,
                      child: Text(
                          "Enter personal Details to your Employees Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400)),
                    ))
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 4, 1, 72),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                           ),
                          child: Text(
                            "Log in",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> SignUpScreen()));
                      },
                      child: Container(
                         padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Text(
                            "Sign up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 4, 1, 72),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
