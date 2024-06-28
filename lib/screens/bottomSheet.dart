// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomSheetPractice extends StatefulWidget {
  const BottomSheetPractice({super.key});

  @override
  State<BottomSheetPractice> createState() => _BottomSheetPracticeState();
}

class _BottomSheetPracticeState extends State<BottomSheetPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        color:Colors.pink[200],
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 120,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[ Column(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(size:50,Icons.camera_alt_outlined)),
                          Text("Camera",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(size:50,Icons.photo_size_select_actual_outlined)),
                          Text("Gallery",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      ],),
                      );
                      },
                      );
   }, 
   child: Text("Bottom Sheet"),
                      ),
      )
    ));
  }
}