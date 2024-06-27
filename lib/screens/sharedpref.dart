// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", userName);
    print("Set username: $userName");
  }

  setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    print("Set email: $email");
  }

  setPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("password", password);
    print("Set password: $password");
  }

  setAddress(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("address", address);
    print("Set address: $address");
  }

  setPhone(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("phone", phone);
    print("Set phone: $phone");
  }

  setAge(String age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("age", age);
    print("Set age: $age");
  }

  setProfile(String image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("image", image);
    print("Set image: $image");

  }

  Future<String?> getDetail(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  printdata() async {
    String? username = await getDetail("name");
    String? email = await getDetail("email");
    String? password = await getDetail("password");
    String? address = await getDetail("address");
    String? phone = await getDetail("phone");
    String? age = await getDetail("age");
    String? image = await getDetail("image");
    print("username: $username");
    print("email: $email");
    print("password: $password");
    print("address: $address");
    print("phone: $phone");
    print("age: $age");
    print("image: $image");
  }

Future<void> saveUserProfile({
  required String username,
  required String email,
  required String password,
  required String address,
  required String phone,
  required String age,
  String? profilePicPath,
}) async {
  await Sharedpref().setUserName(username);
  await Sharedpref().setEmail(email);
  await Sharedpref().setPassword(password);
  await Sharedpref().setAddress(address);
  await Sharedpref().setPhone(phone);
  await Sharedpref().setAge(age);
  if (profilePicPath!= null) {
    await Sharedpref().setProfile(profilePicPath);
  } else {
    await Sharedpref().setProfile("null");
  }
  Sharedpref().printdata();
}

  void clearData()async {
    SharedPreferences pref =await SharedPreferences.getInstance();
     pref.clear();
  }
}


//  Future<String?> getUserName() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return  prefs.getString("name");
//   }

//   Future<String?> getEmail() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("email");
//   }

//   Future<String?> getPassword() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("password");
//   }

//   Future<String?> getAddress() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.getString("address");

//   }

//   Future<String?> getPhone() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("phone");

//   }

//   Future<String?> getAge() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("age");
//   }