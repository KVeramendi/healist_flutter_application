import 'package:healist_flutter_application/Model/macronutrients_chart_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';

List<MacronutrientsChartModel> setMacronutrientsDataList(int days) {
  final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
  final _data = <MacronutrientsChartModel>[];
  if (_chartNutrition.length < days) {
    for (int i = 0; i < _chartNutrition.length; i++) {
      _data.add(MacronutrientsChartModel(
          _chartNutrition[i].dateTime,
          _chartNutrition[i].proteinsIntake,
          _chartNutrition[i].carbohydratesIntake,
          _chartNutrition[i].fatsIntake));
    }
  } else {
    for (int i = _chartNutrition.length - days;
        i < _chartNutrition.length;
        i++) {
      _data.add(MacronutrientsChartModel(
          _chartNutrition[i].dateTime,
          _chartNutrition[i].proteinsIntake,
          _chartNutrition[i].carbohydratesIntake,
          _chartNutrition[i].fatsIntake));
    }
  }
  return _data;
}
