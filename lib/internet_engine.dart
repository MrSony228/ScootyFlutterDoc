import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scooty/model/local_storage.dart';
import 'dart:convert';

import 'package:scooty/model/user_to_register.dart';
final office = "http://10.77.41.245:8080/";

class InternetEngine {
  Future<http.Response> basePost(String url, Map<String, dynamic> json ) async {
    return http.post(Uri.parse('http://192.168.3.42:8080/' + url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body: jsonEncode(json));
  }

  Future<http.Response> baseGet(String url, String data) async {
    return http.get(Uri.http('192.168.3.42:8080', url, {"email": data}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        });
  }

  register(UserToRegister userToRegister) async {
    http.Response response = await basePost('users', userToRegister.toJson());
    if (response.statusCode != 200) {
      return response.statusCode;
    }
  }

  checkExist(String email) async {
    http.Response response = await baseGet('/users/check-exists/', email);
    var data = jsonDecode(response.body);
    return data;
  }

  login(String email, String password) async {
    Map<String, String> data = {
      "username": email,
    "password": password
    };
   http.Response response = await http.post(Uri.http('192.168.3.42:8080', '/users/login/', data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
   );
    if(response.statusCode == 200){
      var headers = response.headers.values.elementAt(2);
      LocalStorage().saveToken(headers);
      return true;
    }
    else{
      return response.statusCode;
    }
  }
}
