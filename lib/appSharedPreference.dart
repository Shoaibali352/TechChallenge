
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:techchallenge/Models/UserModel.dart';

class AppSharedPreference{

  static saveInfo(String key, String val) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, val);
  }
  static getInfo(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? "";
  }
}