// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, must_be_immutable, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:myapp/screens/bottom_navigation.dart';
import 'package:myapp/screens/forgot_password_screen.dart';

import 'package:myapp/screens/signup_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/screens/sharedpref.dart';

class LogInScreen extends StatefulWidget {


  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  TextEditingController passwordController = TextEditingController();
  RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,12}$');

  final formKey = GlobalKey<FormState>();
  bool rememberPassword = false;

  Future<bool?> login(String email, String password) async {
    final storedEmail = await Sharedpref().getDetail('email');
    final storedPassword = await Sharedpref().getDetail('password');
    if (storedEmail == null && storedPassword == null) {
      return false;
    } else if (storedEmail == email && storedPassword == password) {
      return true;
    }
    else {
    return false; 
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
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
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(height: 10),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Welcome Back!",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 6, 50, 86),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )),
                              SizedBox(height: 20),
                              TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return 'Please enter Password';
                                    } else if (!passwordRegExp
                                        .hasMatch(value)) {
                                      return "Please Enter A Valid Password";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: rememberPassword,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            rememberPassword = value!;
                                          });
                                        },
                                        activeColor: const Color.fromARGB(
                                            255, 0, 57, 103),
                                      ),
                                      Text("Remember me",
                                          style:
                                              TextStyle(color: Colors.black45)),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassword()));
                                    },
                                    child: Text(
                                      'Forget password?',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 8, 50, 84),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 7, 55, 94),
                                          foregroundColor: Colors.white),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          bool? isLogIn = await login(
                                              emailController.text,
                                              passwordController.text);
                                          if (isLogIn == true) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNavigation()),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(duration: Duration(seconds: 1),
                                                  content: Text(
                                                      'Log in SuccessFull')),
                                            );
                                          } else if (isLogIn == false) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(duration: Duration(seconds: 1),
                                                  content:
                                                      Text('Login Failed')),
                                            );
                                          } 
                                        } else if (emailController
                                                .text.isEmpty ||
                                            passwordController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(duration: Duration(seconds: 1),
                                                content: Text(
                                                    'Invalid Email & Invalid Password')),
                                          );
                                        }
                                      },
                                      child: Text("Log in"))),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.7,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
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
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Bootstrap.google),
                                    Icon(Bootstrap.facebook),
                                    Icon(Bootstrap.twitter),
                                    Icon(Bootstrap.apple),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Doesn't have an account? "),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                      child: Text("Sign up",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 7, 61, 105))))
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
