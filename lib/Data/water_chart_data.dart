import 'package:healist_flutter_application/Model/water_chart_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';

List<WaterChartModel> setWaterDataList(int days) {
  final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
  final _data = <WaterChartModel>[];
  if (_chartNutrition.length < days) {
    for (int i = 0; i < _chartNutrition.length; i++) {
      _data.add(WaterChartModel(
          _chartNutrition[i].dateTime, _chartNutrition[i].waterConsumption));
    }
  } else {
    for (int i = _chartNutrition.length - days;
        i < _chartNutrition.length;
        i++) {
      _data.add(WaterChartModel(
          _chartNutrition[i].dateTime, _chartNutrition[i].waterConsumption));
    }
  }
  return _data;
}
