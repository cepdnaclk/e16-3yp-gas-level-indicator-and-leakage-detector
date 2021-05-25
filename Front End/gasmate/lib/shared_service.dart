import 'dart:convert';

import 'package:gasmate/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(
        "login_detail", model != null ? jsonEncode(model.toJson()) : null);
  }

  static Future<void> logout() async {
    await setLoginDetails(null);
  }
}
