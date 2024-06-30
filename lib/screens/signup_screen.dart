// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_final_fields, non_constant_identifier_names, avoid_print, unnecessary_null_comparison, use_build_context_synchronously, unnecessary_string_interpolations, await_only_futures

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/sharedpref.dart';

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

  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  XFile? profilepic;
  ImagePicker picker = ImagePicker();
  final signupkey = GlobalKey<FormState>();
  bool agree = false;
  DateTime? selectedDate;
  String? date;
  int? age;

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
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 120,
                                  color: Color.fromARGB(255, 82, 255, 223),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: clickImage,
                                              icon: Icon(
                                                  size: 50,
                                                  Icons.camera_alt_outlined)),
                                          Text(
                                            "Camera",
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: getImage,
                                              icon: Icon(
                                                  size: 50,
                                                  Icons
                                                      .photo_size_select_actual_outlined)),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.amber[100],
                            child: profilepic == null
                                ? Icon(Icons.add_photo_alternate_outlined,
                                    size: 40)
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        FileImage(File(profilepic!.path)),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Form(
                          key: signupkey,
                          child: Column(children: [
                            TextFormField(
                                keyboardType: TextInputType.emailAddress,
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
                                )),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 10),
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
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Please enter Address";
                                }
                                return null;
                              },
                              controller: addressController,
                              decoration: InputDecoration(
                                labelText: 'Address',
                                hintText: "Enter Address",
                                hintStyle: TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'Please enter Phone Number';
                                }
                                return null;
                              },
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Phone No.',
                                  hintText: "Enter Phone Number",
                                  hintStyle: TextStyle(color: Colors.black26),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            const SizedBox(height: 10),
                            Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.black54),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    // color: Colors.white
                                    ),
                                child: Row(children: [
                                  IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1945),
                                          lastDate: DateTime(2100),
                                          helpText: "Select DOB"
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            selectedDate = pickedDate;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                          size: 25,
                                          Icons.calendar_month_outlined,
                                          color: Colors.black87)),
                                  SizedBox(width: 10),
                                  selectedDate != null
                                      ? Text(
                                          "${dateFormat()}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        )
                                      : Text("Enter DOB ",
                                          style: TextStyle(color: Colors.black)),
                                          SizedBox(width:140),
                                          selectedDate != null ?
                                          Text(
                                            "${calcAge(selectedDate!)}",style: TextStyle(color: Colors.black)
                                          )
                                          :
                                          Text("Age",style:TextStyle(color: Colors.black))
                                ])),

                          
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
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (signupkey.currentState!.validate() &&
                                          agree && selectedDate!= null ) {
                                        await Sharedpref().saveUserProfile(
                                            username: usernameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            address: addressController.text,
                                            phone: phoneController.text,
                                            dob: date!,
                                            profilePicPath:
                                                profilepic?.path ?? "no-image");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LogInScreen()));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 1),
                                            content:
                                                Text('Sign up Successfully'),
                                          ),
                                        );
                                      } else if (signupkey.currentState!
                                              .validate() &&
                                          agree == false) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Text(
                                                'Please Agree the Policy & Services'),
                                          ),
                                        );
                                      } else if (!signupkey.currentState!
                                          .validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Text(
                                                'Please Fill Correct Details'),
                                          ),
                                        );
                                      
                                      } else if (signupkey.currentState!.validate() &&
                                          agree && selectedDate== null ) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Text(
                                                'Please Select you Date Of Birth'),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LogInScreen()));
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

  String dateFormat() {
     date = DateFormat('MM/dd/yyyy').format(selectedDate!);
    Sharedpref().setDob(date!);
    return date!;
  }
}

int calcAge( DateTime selectedDate) 
{
  DateTime now = DateTime.now();
  DateTime dob =  selectedDate;
  int age = now.year - dob.year;
   Sharedpref().setAge(age);
  return age;
}