// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_function_literals_in_foreach_calls, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: DataService().getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'ID: ${snapshot.data![index].id!.toString()}'),
                                Text(
                                    'FullName: ${snapshot.data![index].fullname! }'),
                                Text('Email: ${snapshot.data![index].email!}'),
                                Text(
                                    'City: ${snapshot.data![index].address!.city!}')
                              ])),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}

class DataService {
  Future<List<User>> getData() async {
    String response = await rootBundle.loadString('assets/json/userdata.json');
    Map<String, dynamic> res = jsonDecode(response);
    List<dynamic> data = res['users'];
    List<User> apiData = [];
    data.forEach((value) {
      apiData.add(User.fromJson(value));
    });
    return apiData;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? password;
  String? fullname;
  int? age;
  String? gender;
  Address? address;
  List<Phone>? phonenumbers;
  User(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.fullname,
      this.age,
      this.gender,
      this.address,
      this.phonenumbers});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        fullname: json['full_name'],
        age: json['age'],
        gender: json['gender'],
        address: Address.fromJson(json['address']),
        phonenumbers: (json['phone_numbers'] as List)
            .map((phoneJson) => Phone.fromJson(phoneJson))
            .toList());
  }

  @override
  String toString() {
    return '''
id: $id
username: $username
email: $email
password: $password
street: ${address?.street}
city: ${address?.city}
zipcode: ${address?.zipcode}
phone_numbers: ${phonenumbers?.map((phone) => '{type: ${phone.type} , number: ${phone.number}}\n').toList()}

''';
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  Address({this.street, this.city, this.state, this.country, this.zipcode});
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipcode: json['zip_code'],
    );
  }
}

class Phone {
  String? type;
  String? number;
  Phone({this.type, this.number});
  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(type: json['type'], number: json['number']);
  }
}
