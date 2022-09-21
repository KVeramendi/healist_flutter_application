import 'dart:convert';

import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _sharedPreferences;
  static const _keyUser = 'user';
  static User myUser = User(
      fullName: 'Kevin Veramendi',
      email: 'kveramendi18@gmail.com',
      password: 'veramendiHealist26/07',
      weight: 70.0,
      height: 174.0,
      age: 28,
      physicalActivity: 'Regular',
      gender: 'Masculino',
      userImagePath:
          'https://adscvcongreso2022.onsitevents.com/assets/imgs/default/default-logo.jpg');

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _sharedPreferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _sharedPreferences.getString(_keyUser);
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
