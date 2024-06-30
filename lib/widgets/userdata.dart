// ignore_for_file: camel_case_types, avoid_print, unused_import, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/widgets/userApi.dart';

class UserDto {
  int? id;
  String? username;
  String? email;
  AddressModel? address;
  UserDto({this.id, this.username, this.email, this.address});

  @override
  String toString(){
    return '''Id: $id,
     Username: $username,
      Email: $email,
      City: ${address!.city},
      Street: ${address!.street},
      Suite: ${address!.suite},
      ''';
  }
  }


class AddressModel {
  String? street;
  String? suite;
  String? city;
  AddressModel({this.street, this.suite, this.city});
}

class DataModel {
  List<UserDto> finaldata = [];
  Future<List<UserDto>> getData() async {
    String str = await rootBundle.loadString('assets/json/userdata.json');
    Map<String, dynamic> jsondatamap = jsonDecode(str);

    List<dynamic> jsondata = jsondatamap['users'];

    Map<String, dynamic> mapData = {};
    jsondata.forEach((value) {
      mapData = value;
      UserDto userdto = UserDto(
        id: mapData['id'],
        username: mapData['username'],
        email: mapData['email'],
        address: AddressModel(
            street: mapData['address']['street'],
            suite: mapData['address']['suite'],
            city: mapData['address']['city']),
      );
      finaldata.add(userdto);
    });
    return finaldata;
  }
}

class ApiCode extends StatefulWidget {
  const ApiCode({super.key});

  @override
  State<ApiCode> createState() => _ApiCodeState();
}

class _ApiCodeState extends State<ApiCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: ElevatedButton(
      onPressed: () async{
       List<UserDto> data= await DataModel().getData();
       print(data.toString());
      },
      child: const Text('Api Code'),
    ))));
  }
}
