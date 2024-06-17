// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_final_fields, non_constant_identifier_names, avoid_print, unnecessary_null_comparison


import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:myapp/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  TextEditingController usernameController = TextEditingController();
  RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,16}$');

  TextEditingController passwordController = TextEditingController();
  RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,12}$');

  XFile? profilepic;
  ImagePicker picker = ImagePicker();
  final signupkey = GlobalKey<FormState>();
  bool agree = false;

  getImage() async {
    XFile? Photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profilepic = Photo;
    });
    print("Image Picked");
    print(Photo!.path);
  }

  clickImage() async {
    XFile? Photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      profilepic = Photo;
    });
    print("Image Clicked");
    print(Photo!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          Image.asset('assets/images/bg-image.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity),
          Column(children: [
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: profilepic == null
                              ? Icon(Icons.camera)
                              : CircleAvatar(
                                  backgroundImage:
                                      FileImage(File(profilepic!.path)),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Form(
                          key: signupkey,
                          child: Column(children: [
                            TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Please enter Email';
                                  } else if (!emailRegExp.hasMatch(value)) {
                                    return 'Please Enter a Valid Email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(color: Colors.black26),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                )),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: "Enter Username",
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'Please enter Username';
                                } else if (!usernameRegExp.hasMatch(value)) {
                                  return "Please Enter a Valid Username";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: "Enter Password",
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'Please enter Password';
                                } else if (!passwordRegExp.hasMatch(value)) {
                                  return "Please Enter A Valid Password";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: getImage,
                                  child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black12, width: 3),
                                      ),
                                      child: Text("Add Profile pic")),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: clickImage,
                                  child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black12, width: 3),
                                      ),
                                      child: Text("Click Profile pic")),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                  value: agree,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      agree = value!;
                                    });
                                  },
                                  activeColor:
                                      const Color.fromARGB(255, 0, 57, 103),
                                ),
                                Text("I agree to the Proceesing of ",
                                    style: TextStyle(color: Colors.black45)),
                                Text("Personal Data ",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 1, 62, 112),
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(height: 15),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (signupkey.currentState!.validate() &&
                                          agree &&  profilepic!=null) {
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen(email: emailController.text,password: passwordController.text,pic:XFile(profilepic!.path))));
                                       ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Sign up Successfully with Pic'),
                                          ),
                                        );
                                      } 
                                     else if (signupkey.currentState!.validate() &&
                                          agree && profilepic==null) {
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen(email: emailController.text,password: passwordController.text)));
                                       ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Sign up Successfully Without Pic'),
                                          ),
                                        );
                                      } 
                                      else if (!signupkey.currentState!.validate()){
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Please Fill Correct Details'),
                                          ),
                                        );
                                      }
                                      else{
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Agree the Personal Data For Processing'),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 7, 73, 127),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text("Sign up"))),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Sign up with",
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                )),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Bootstrap.facebook),
                                Icon(Bootstrap.twitter),
                                Icon(Bootstrap.google),
                                Icon(Bootstrap.apple),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                                GestureDetector(
                                            
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                                  },
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 7, 68, 118)),
                                  ),
                                ),
                              ],
                            )
                          ]))
                    ]),
                  ),
                ))
          ])
        ]));
  }
}
