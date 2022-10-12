import 'dart:convert';

import 'package:healist_flutter_application/Model/chart_nutrition_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChartNutritionPreferences {
  static late SharedPreferences _sharedPreferences;
  static const _keyChartNutrition = 'chartNutrition';
  static List<ChartNutritionModel> myChartNutrition = [
    ChartNutritionModel(
        dateTime: DateTime(2022, 10, 04),
        kilocaloriesConsumption: 0,
        proteinsIntake: 0,
        carbohydratesIntake: 0,
        fatsIntake: 0,
        waterConsumption: 0,
        fruitsVegetablesIntake: 0)
  ];

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future setChartNutrition(
      List<ChartNutritionModel> chartNutritionList) async {
    final json = jsonEncode(chartNutritionList
        .map<Map<String, dynamic>>((item) => item.toJson())
        .toList());
    await _sharedPreferences.setString(_keyChartNutrition, json);
  }

  static List<ChartNutritionModel> getChartNutrition() {
    final json = _sharedPreferences.getString(_keyChartNutrition);
    return json == null
        ? myChartNutrition
        : (jsonDecode(json) as List<dynamic>)
            .map<ChartNutritionModel>(
                (item) => ChartNutritionModel.fromJson(item))
            .toList();
  }
}
