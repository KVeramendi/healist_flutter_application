import 'package:healist_flutter_application/Model/water_chart_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';

final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
final oneWeekWaterData = _setDataList(7);
final oneMonthWaterData = _setDataList(31);
final threeMonthsWaterData = _setDataList(91);
final sixMonthsWaterData = _setDataList(182);
final oneYearWaterData = _setDataList(365);

List<WaterChartModel> _setDataList(int days) {
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
