// ignore_for_file: file_names, camel_case_types, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:convert';

import 'package:http/http.dart';

class UserDto {
  int? id;
  String? name;
  String? phone;
  AddressModel? userAddress;
  UserDto({this.id, this.name, this.phone, this.userAddress});

  @override
  String toString() {
    return '''
    id: $id,
    name: $name,
    phone:$phone,
    street:${userAddress!.street},
    zipcode:${userAddress!.zipcode}
    ''';
  }
}

class AddressModel {
  String? street;
  String? zipcode;
  AddressModel({this.street, this.zipcode});
}

class userDataService {
  Future<dynamic> getData() async {
    String apiUrl = "https://jsonplaceholder.typicode.com/users";
    Response res = await get(Uri.parse(apiUrl));
    List<dynamic> apiData = json.decode(res.body);
    return apiData;
  }

  Future<List<UserDto>> mapdata(List<dynamic> apiData) async {
    List<UserDto> finalData = [];
    Map<String, dynamic> mapData = {};
    apiData.forEach((value) {
      mapData = value;
      UserDto userDto = UserDto(
        id: mapData['id'],
        name: mapData['name'],
        phone: mapData['phone'],
        userAddress: AddressModel(
          street: mapData['address']['street'],
          zipcode: mapData['address']['zipcode'],
        ),
      );
      finalData.add(userDto);
    });
    return finalData;
  }
}

void main() async {
  // List<dynamic> apiDataGetData = await userDataService().getData();
  // List<UserDto> apiFinalData = await userDataService().mapdata(apiDataGetData);
  // apiFinalData.forEach((value) {
  //   print(value.toString());
  // });
}
