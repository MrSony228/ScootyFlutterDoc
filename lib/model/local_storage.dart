import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _tokenProvider = LocalStorage._internal();

  factory LocalStorage() {
    return _tokenProvider;
  }

  LocalStorage._internal();

  static const TOKEN_KEY = "token";

  saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN_KEY, token);
  }

  Future<bool> deleteToken()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(TOKEN_KEY);
    token ??= "";
    return token;
  }

}
