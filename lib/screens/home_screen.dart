// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, unnecessary_string_interpolations

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/screens/sharedpref.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  String? email;
  String? password;
  String? address;
  String? phone;
  int? age;
  String? image;
  @override
  void initState() {
    super.initState();
    loadData();
  }

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
                    onPressed: appLogout,
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 50,
            right: 50,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: image == "no-image"
                              ? AssetImage('assets/images/default_avatar.jpg')
                              : image != null
                                  ? FileImage(File(image!))
                                  : null,
                        )
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome,",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                                text: username != null
                                    ? "${username!.toUpperCase()}"
                                    : '',
                                style: const TextStyle(color: Colors.black))
                          ]),
                    )
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(email!,
                //         style: TextStyle(fontWeight: FontWeight.w700)),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                )
              ]),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70))),
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Username: $username", style: TextStyle(fontSize: 15)),
                    Text("Email: $email", style: TextStyle(fontSize: 15)),
                    Text("Password: $password", style: TextStyle(fontSize: 15)),
                    Text("Address: $address", style: TextStyle(fontSize: 15)),
                    Text("Phone: $phone", style: TextStyle(fontSize: 15)),
                    Text("Age: $age", style: TextStyle(fontSize: 15)),
                    Text("Image: $image", style: TextStyle(fontSize: 15)),
                  ]),
              // width:300
            ),
          )
        ],
      ),
    ));
  }

  Future<void> loadData() async {
    username = await Sharedpref().getDetail('name');
    email = await Sharedpref().getDetail('email');
    password = await Sharedpref().getDetail('password');
    address = await Sharedpref().getDetail('address');
    phone = await Sharedpref().getDetail('phone');
    age = await Sharedpref().getAge('age');
    image = await Sharedpref().getDetail('image');
    setState(() {});
  }

  void appLogout() {
    Sharedpref().clearData();
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Logout SuccessFully'),
      ),
    );
  }
}
