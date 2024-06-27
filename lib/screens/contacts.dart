import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Contacts",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                        onPressed: () {},
                        child: const Icon(Icons.add, size: 40))),
                const Text("Add to Contacts",
                    style: TextStyle(color: Colors.white, fontSize: 20))
              ],
            )));
  }
}
