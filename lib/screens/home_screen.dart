// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  XFile? showpic;
  HomeScreen({this.showpic});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: 140,
            child: AppBar(
              leading: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              title: const Text(
                "HomeScreen",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.155,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
                child: Column(children: [
                  Row(
                    children: [
                      Text("FIRSTNAME LASTNAME",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("College Name",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      widget.showpic == null
                          ? CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 35,
                              ))
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  FileImage(File(widget.showpic!.path)),
                            )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.all(4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: Text(
                              "TODO LIST",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.green,
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.all(4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: Text(
                              "EDIT PROFILE",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
