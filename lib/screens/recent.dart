// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Recent",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.red, width: 8),
              vertical: BorderSide(color: Colors.green, width: 8),
            ),
          boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // vertical shadow
              ),
              BoxShadow(
                color: Colors.pink.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(3, 0), // horizontal shadow
              ),
            ],
          ),
          child: Center(child: Text("Dart Code Test",style: TextStyle(decoration: TextDecoration.underline,color:Colors.white,fontStyle: FontStyle.italic),)),
        ),
      ),
    );
  }
}
