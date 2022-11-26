import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/chart_nutrition_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';
import 'package:healist_flutter_application/Util/daily_nutrition_preferences.dart';
import 'package:healist_flutter_application/Util/reminder_preferences.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Menu/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await DailyNutritionPreferences.init();
  await ChartNutritionPreferences.init();
  await ReminderPreferences.init();
  await updateChartNutritionList();
  runApp(const MyApp());
}

updateChartNutritionList() {
  final _charNutrition = ChartNutritionPreferences.getChartNutrition();
  final _lastDay = _charNutrition.last.dateTime;
  final _today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _differenceDays = daysBetween(_lastDay, _today);
  if (_differenceDays > 0) {
    for (int i = 0; i < _differenceDays; i++) {
      _charNutrition.add(ChartNutritionModel(
          dateTime: _lastDay.add(Duration(days: (i + 1))),
          kilocaloriesConsumption: 0,
          proteinsIntake: 0,
          carbohydratesIntake: 0,
          fatsIntake: 0,
          waterConsumption: 0,
          fruitsVegetablesIntake: 0));
    }
    ChartNutritionPreferences.setChartNutrition(_charNutrition);
    DailyNutritionPreferences.setDailyNutrition(
        DailyNutritionPreferences.myDailyNutrition);
  }
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _user = UserPreferences.getUser();
    return MaterialApp(
        home: _user.email == 'test@test.dev' || _user.closedSession
            ? const LoginPage()
            : const HomePage(),
        title: 'Healist',
        theme: ThemeData(fontFamily: 'Mali'),
        debugShowCheckedModeBanner: false);
  }
}
