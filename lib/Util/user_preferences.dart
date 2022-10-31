import 'dart:convert';

import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _sharedPreferences;
  static const _keyUser = 'user';
  static UserModel myUser = UserModel(
      fullName: '',
      email: 'test@test.dev',
      password: 'test.dev',
      weight: 0,
      height: 0,
      age: 0,
      physicalActivity: '',
      gender: '',
      water: 0,
      kilocalories: 0,
      fruitsVegetables: 0,
      proteins: 0,
      carbohydrates: 0,
      fats: 0,
      userImagePath: 'assets/images/user_profile_logo.jpg',
      closedSession: true);

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future setUser(UserModel user) async {
    final json = jsonEncode(user.toJson());
    await _sharedPreferences.setString(_keyUser, json);
  }

  static UserModel getUser() {
    final json = _sharedPreferences.getString(_keyUser);
    return json == null ? myUser : UserModel.fromJson(jsonDecode(json));
  }
}
