// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/screens/signup_screen.dart';


// import 'package:myapp/widgets/expansionwidget.dart';
// import 'package:myapp/widgets/spclass.dart';
// import 'package:myapp/widgets/userdata.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
     
      home:   SignUpScreen(),
    );
  }
}
