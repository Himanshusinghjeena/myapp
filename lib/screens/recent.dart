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
          
      appBar: AppBar(automaticallyImplyLeading: false,title: const Text("Recent",style: TextStyle(color:Colors.white),),
      backgroundColor: Colors.black,
      ),
      body:Container(color:Colors.grey)
    );  }
}