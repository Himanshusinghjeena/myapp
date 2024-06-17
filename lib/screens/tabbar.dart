// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
 Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text("WhatsApp",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
          actions: [
            IconButton(icon: Icon(Icons.qr_code_scanner,color: Colors.white,),onPressed: (){}),
            IconButton(icon: Icon(Icons.camera_alt_outlined,color: Colors.white),onPressed: (){}),
            IconButton(icon: Icon(Icons.more_vert_sharp,color: Colors.white),onPressed: (){})
          ],
        bottom:  TabBar(tabs: [
             Tab(icon:Icon(Icons.chat,color: Colors.white,),child: Text("Chat")), 
             Tab(icon:Icon(Icons.refresh,color: Colors.white),child: Text("Updates")),
             Tab(icon:Icon(Icons.group,color: Colors.white),child: Text("Groups")),
             Tab(icon:Icon(Icons.call,color: Colors.white),child: Text("Calls")),
          ]),
        ),
        
        body: TabBarView(
          children: [
            Center(child: Text("Home")),
            Center(child: Text("Calls")),
            Center(child: Text("Group")),
            Center(child: Text("Chat")),
          ],
        ),
      ),
    );
  }
}