import 'dart:convert';

import 'package:healist_flutter_application/Model/daily_nutrition_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyNutritionPreferences {
  static late SharedPreferences _sharedPreferences;
  static const _keyDailyNutrition = 'dailyNutrition';
  static DailyNutritionModel myDailyNutrition = DailyNutritionModel(
      dailyWater: 0,
      dailyKilocalories: 0,
      dailyFruitsVegetables: 0,
      dailyProteins: 0,
      dailyCarbohydrates: 0,
      dailyFats: 0,
      dailyBreakfast: 0,
      dailyLunch: 0,
      dailyDinner: 0);

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future setDailyNutrition(DailyNutritionModel dailyNutrition) async {
    final json = jsonEncode(dailyNutrition.toJson());
    await _sharedPreferences.setString(_keyDailyNutrition, json);
  }

  static DailyNutritionModel getDailyNutrition() {
    final json = _sharedPreferences.getString(_keyDailyNutrition);
    return json == null
        ? myDailyNutrition
        : DailyNutritionModel.fromJson(jsonDecode(json));
  }
}
