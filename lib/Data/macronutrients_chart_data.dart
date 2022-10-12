import 'package:healist_flutter_application/Model/macronutrients_chart_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';

final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
final oneWeekMacronutrientsData = _setDataList(7);
final oneMonthMacronutrientsData = _setDataList(31);
final threeMonthsMacronutrientsData = _setDataList(91);
final sixMonthsMacronutrientsData = _setDataList(182);
final oneYearMacronutrientsData = _setDataList(365);

List<MacronutrientsChartModel> _setDataList(int days) {
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
