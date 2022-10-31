import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/Widget/custom_card_widget.dart';

class KilocaloriesCardWidget extends StatelessWidget {
  const KilocaloriesCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = UserPreferences.getUser();
    final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
    return CustomCardWidget(
        initialValue: _chartNutrition.first.kilocaloriesConsumption,
        lastValue: _chartNutrition.last.kilocaloriesConsumption,
        goalValue: _user.kilocalories,
        nutrientText: 'kilocalorías',
        nutrientUnitText: 'kcal');
  }
}
