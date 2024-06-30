// ignore_for_file: use_function_type_syntax_for_parameters, prefer_interpolation_to_compose_strings, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously, avoid_types_as_parameter_names

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  DemoView createState() {
    return DemoView();
  }
}

class DemoView extends State<Demo> {
  SharedPref sharedPref = SharedPref();
  User userSave = User();
  List<User> userList = [];

  loadSharedPrefs() async {
    try {
      List<User> users = await sharedPref.read("users");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Loaded!"),
          duration: const Duration(milliseconds: 500)));
      setState(() {
        userList = users;
      });
    } catch (Exception) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Nothing found!"),
          duration: const Duration(milliseconds: 500)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    height: 50.0,
                    width: 300.0,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Name"),
                      onChanged: (value) {
                        setState(() {
                          userSave.name = value;
                        });
                      },
                    )),
                SizedBox(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Age"),
                      onChanged: (value) {
                        setState(() {
                          userSave.age = value;
                        });
                      },
                    )),
                SizedBox(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Location"),
                      onChanged: (value) {
                        setState(() {
                          userSave.location = value;
                        });
                      },
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await sharedPref.save("users", userSave);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Saved!"),
                        duration: const Duration(milliseconds: 500)));
                    loadSharedPrefs();
                  },
                  child: Text('Save', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    loadSharedPrefs();
                  },
                  child: Text('Load', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await sharedPref.remove("users");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Cleared!"),
                        duration: const Duration(milliseconds: 500)));
                    setState(() {
                      userList = [];
                    });
                  },
                  child: Text('Clear', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300.0,
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                User user = userList[index];
                return ListTile(
                  title: Text("Name: " + (user.name ?? "")),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Age: " + (user.age ?? "")),
                      Text("Location: " + (user.location ?? "")),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SharedPref {
  Future<List<User>> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);

    if (jsonString == null) {
      return [];
    }

    List<dynamic> jsonList = json.decode(jsonString);
    List<User> users = jsonList.map((json) => User.fromJson(json)).toList();
    return users;
  }

  Future<void> save(String key, User value) async {
    final prefs = await SharedPreferences.getInstance();
    List<User> users = await read(key);
    users.add(value);
    prefs.setString(key, json.encode(users));
  }

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

class User {
  String? name;
  String? age;
  String? location;

  User({this.name, this.age, this.location});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        location = json['location'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'location': location,
      };
}
