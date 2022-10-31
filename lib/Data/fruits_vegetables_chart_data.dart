import 'package:healist_flutter_application/Model/fruits_vegetables_chart_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';

List<FruitsVegetablesChartModel> setFruitsVegetablesDataList(int days) {
  final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
  final _data = <FruitsVegetablesChartModel>[];
  if (_chartNutrition.length < days) {
    for (int i = 0; i < _chartNutrition.length; i++) {
      _data.add(FruitsVegetablesChartModel(_chartNutrition[i].dateTime,
          _chartNutrition[i].fruitsVegetablesIntake));
    }
  } else {
    for (int i = _chartNutrition.length - days;
        i < _chartNutrition.length;
        i++) {
      _data.add(FruitsVegetablesChartModel(_chartNutrition[i].dateTime,
          _chartNutrition[i].fruitsVegetablesIntake));
    }
  }
  return _data;
}
