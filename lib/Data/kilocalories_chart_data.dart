import 'package:healist_flutter_application/Model/kilocalories_chart_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';

List<KilocaloriesChartModel> setKilocaloriesDataList(int days) {
  final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
  final _data = <KilocaloriesChartModel>[];
  if (_chartNutrition.length < days) {
    for (int i = 0; i < _chartNutrition.length; i++) {
      _data.add(KilocaloriesChartModel(_chartNutrition[i].dateTime,
          _chartNutrition[i].kilocaloriesConsumption));
    }
  } else {
    for (int i = _chartNutrition.length - days;
        i < _chartNutrition.length;
        i++) {
      _data.add(KilocaloriesChartModel(_chartNutrition[i].dateTime,
          _chartNutrition[i].kilocaloriesConsumption));
    }
  }
  return _data;
}
