import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences pref;

  SharedPreferencesHelper({required this.pref});

  Future<void> setLang(String lang) async {
    await pref.setString("lang", lang);
  }

  Future<void> setUserToken(String userToken) async {
    await pref.setString("userToken", userToken);
  }

  Future<void> setUserId(int userToken) async {
    await pref.setInt("userId", userToken);
  }

  Future<void> setUserName(String userName) async {
    await pref.setString("userName", userName);
  }

  String get getUserToken {
    return pref.getString("userToken") ?? "";
  }

  String get getUserName {
    return pref.getString("userName") ?? "";
  }

  int get getUserId {
    return pref.getInt("userId") ?? 0;
  }

  String get getLang {
    return pref.getString("lang") ?? "AppText.fr";
  }
}
