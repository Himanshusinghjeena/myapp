// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/screens/contacts.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/recent.dart';
import 'package:myapp/screens/tabbar.dart';

class BottomNavigation extends StatefulWidget {
XFile? pic;

  BottomNavigation({this.pic});
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex=0;
  PageController pageController= PageController();
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title:Text("Bottom Navigator"),
    //  ),
      body:PageView(
        controller: pageController,
          children: [
           widget.pic!=null ? HomeScreen(showpic: XFile(widget.pic!.path),): HomeScreen(),
          TabBarWidget(),
          Recent(),
          Contact(),
          ],
        ),
        
      
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.star_border), label: 'Favourites'),
        BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined), label: 'Recent'),
        BottomNavigationBarItem(icon: Icon(Icons.perm_contact_cal_sharp), label: 'Contacts'),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.grey,
      ),
        );
  
  }
}