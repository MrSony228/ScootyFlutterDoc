import 'package:http/http.dart' as http;
import 'package:scooty/model/local_storage.dart';
import 'package:scooty/model/parking_places.dart';
import 'dart:convert';
import 'package:scooty/model/user_to_register.dart';

import 'model/transport.dart';

// 10.77.41.245
// 192.168.3.42
const String localhost = "10.77.41.245";

class InternetEngine {
  Future<http.Response> basePost(String url, Map<String, dynamic> json) async {
    return http.post(Uri.parse('http://'  + localhost + ':8080/' + url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
  },
        body: jsonEncode(json));
  }

  Future<http.Response> baseGet(String url, String data) async {
    return http.get(Uri.http(localhost + ':8080', url, {"email": data}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        });
  }

  register(UserToRegister userToRegister) async {
    http.Response response = await basePost('users/registration/', userToRegister.toJson());
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
    Map<String, String> data = {"username": email, "password": password};
    http.Response response = await http.post(
      Uri.http(localhost + ':8080', '/users/login/', data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var headers = response.headers.values.elementAt(2);
      LocalStorage().saveToken(headers);
      return true;
    } else {
      return response.statusCode;
    }
  }

  Future<List<ParkingPlaces>?> getTransport(String userLatitude,
      String userLongitude, String maxDist, String _batteryLevel) async {
    String token = "";
    await LocalStorage().getToken().then((String result) {
      token = result;
    });
    var response = await http.get(
        Uri.http(localhost + ':8080', '/transport/parking-places/', {
          "userLatitude": userLatitude,
          "userLongitude": userLongitude,
          "maxDist": maxDist,
          "batteryLevel": _batteryLevel
        }),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'x-auth-token': token
        });
    if(response.statusCode != 403) {
      return (json.decode(response.body) as List)
          .map((data) => ParkingPlaces.fromJson(data))
          .toList();
    }
    else
      {
        return null;
      }
  }
  Future<Transport> getTransportByQrCode(String qrCode) async{
    String token = "";
    await LocalStorage().getToken().then((String result) {
      token = result;
    });
    var response = await http.get(
        Uri.http(localhost + ':8080', '/transport/qr-code/', {
          "qrCode": qrCode,
        }),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'x-auth-token': token
        });
    return Transport.fromJson(jsonDecode(response.body)) ;
  }

  Future<UserToRegister?> getUser() async{
    String token = "";
    await LocalStorage().getToken().then((String result) {
      token = result;
    });
    var response = await http.get(
        Uri.http(localhost + ':8080', '/users/get/', {
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          'x-auth-token': token
        });
    if(response.statusCode == 403){
      return null;
    }
    return UserToRegister.fromJson(jsonDecode(response.body)) ;
  }
}
