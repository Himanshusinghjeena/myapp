import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: const Text("Contacts",style: TextStyle(color:Colors.white),),
      backgroundColor: Colors.black,
      ),
      body:Container(color:Colors.grey)
    );
  }
}