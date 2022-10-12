import 'package:healist_flutter_application/Model/kilocalories_chart_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';

final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
final oneWeekKilocaloriesData = _setDataList(7);
final oneMonthKilocaloriesData = _setDataList(31);
final threeMonthsKilocaloriesData = _setDataList(91);
final sixMonthsKilocaloriesData = _setDataList(182);
final oneYearKilocaloriesData = _setDataList(365);

List<KilocaloriesChartModel> _setDataList(int days) {
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
