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

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(TOKEN_KEY);
    token ??= "";
    return token;
  }
}
