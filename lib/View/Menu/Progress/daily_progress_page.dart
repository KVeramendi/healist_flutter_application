import 'package:ai_progress/ai_progress.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/daily_nutrition_model.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/daily_nutrition_preferences.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';

class DailyProgressPage extends StatefulWidget {
  const DailyProgressPage({Key? key}) : super(key: key);

  @override
  State<DailyProgressPage> createState() => _DailyProgressPageState();
}

class _DailyProgressPageState extends State<DailyProgressPage> {
  UserModel user = UserPreferences.getUser();
  final DailyNutritionModel dailyNutrition =
      DailyNutritionPreferences.getDailyNutrition();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(children: [
            SizedBox(
                width: 35.0,
                child: Image.asset('assets/images/water_glass.png')),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            RotatedBox(
                quarterTurns: 3,
                child: SizedBox(
                    width: 80.0,
                    child: LinearProgressIndicator(
                        value: dailyNutrition.dailyWater < user.water
                            ? dailyNutrition.dailyWater / user.water
                            : 1.0,
                        backgroundColor: Colors.grey.shade200,
                        color: const Color(0xFF1ECF6C),
                        minHeight: 5.5))),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Text('${dailyNutrition.dailyWater.toStringAsFixed(1)} L')
          ]),
          Stack(alignment: Alignment.center, children: <Widget>[
            AirDashboardStateProgressIndicator(
                size: const Size(160, 160),
                min: 0,
                max: 100.0,
                value: dailyNutrition.dailyKilocalories < user.kilocalories
                    ? (dailyNutrition.dailyKilocalories / user.kilocalories) *
                        100
                    : 100, //1~100 %
                gapDegree: 50,
                pathColor: Colors.grey.shade200,
                valueColor: const Color(0xFF1ECF6C),
                pathStrokeWidth: 12.0,
                valueStrokeWidth: 6.0,
                roundCap: true),
            Column(children: [
              Text('${dailyNutrition.dailyKilocalories}',
                  style: const TextStyle(
                      color: Color(0xFF1ECF6C), fontSize: 32.0)),
              Text('/ ${user.kilocalories.round()}',
                  style:
                      const TextStyle(color: Colors.black54, fontSize: 12.0)),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
              const Text('kcal',
                  style: TextStyle(color: Color(0xFF1ECF6C), fontSize: 16.0)),
              const Padding(padding: EdgeInsets.only(bottom: 15.0))
            ]),
            Padding(
                padding: const EdgeInsets.only(top: 135.0),
                child: SizedBox(
                    width: 65.0,
                    child: Image.asset('assets/images/goal.png',
                        color: dailyNutrition.dailyKilocalories >=
                                user.kilocalories
                            ? Colors.yellow.withGreen(200)
                            : Colors.grey.shade400)))
          ]),
          Column(children: [
            SizedBox(
                width: 35.0,
                child: Image.asset('assets/images/fruit_vegetable.png')),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            RotatedBox(
                quarterTurns: 3,
                child: SizedBox(
                    width: 80.0,
                    child: LinearProgressIndicator(
                        value: dailyNutrition.dailyFruitsVegetables <
                                user.fruitsVegetables
                            ? dailyNutrition.dailyFruitsVegetables /
                                user.fruitsVegetables
                            : 1.0,
                        backgroundColor: Colors.grey.shade200,
                        color: const Color(0xFF1ECF6C),
                        minHeight: 5.5))),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Text('${dailyNutrition.dailyFruitsVegetables} g')
          ])
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(children: [
            Text('Proteínas',
                style: TextStyle(color: Colors.blueAccent.shade700)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            SizedBox(
                width: 80.0,
                child: LinearProgressIndicator(
                    value: dailyNutrition.dailyProteins < user.proteins
                        ? dailyNutrition.dailyProteins / user.proteins
                        : 1.0,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blueAccent.shade700,
                    minHeight: 5.0)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text('${dailyNutrition.dailyProteins.toStringAsFixed(2)} g',
                style: TextStyle(color: Colors.blueAccent.shade700))
          ]),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Column(children: [
            Text('Carbohidratos',
                style: TextStyle(color: Colors.redAccent.shade700)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            SizedBox(
                width: 80.0,
                child: LinearProgressIndicator(
                    value: dailyNutrition.dailyCarbohydrates <
                            user.carbohydrates
                        ? dailyNutrition.dailyCarbohydrates / user.carbohydrates
                        : 1.0,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.redAccent.shade700,
                    minHeight: 5.0)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text('${dailyNutrition.dailyCarbohydrates.toStringAsFixed(2)} g',
                style: TextStyle(color: Colors.redAccent.shade700)),
          ]),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Column(children: [
            Text('Grasas',
                style: TextStyle(color: Colors.orangeAccent.shade400)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            SizedBox(
                width: 80.0,
                child: LinearProgressIndicator(
                    value: dailyNutrition.dailyFats < user.fats
                        ? dailyNutrition.dailyFats / user.fats
                        : 1.0,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.orangeAccent.shade400,
                    minHeight: 5.0)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text('${dailyNutrition.dailyFats.toStringAsFixed(2)} g',
                style: TextStyle(color: Colors.orangeAccent.shade400)),
          ])
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
        Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF1ECF6C), width: 2.0))),
            child: const Text('ALIMENTOS',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset('assets/images/breakfast.png', width: 42.0),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          const Expanded(
              child: Text('Desayuno', style: TextStyle(fontSize: 18.0))),
          Text('${dailyNutrition.dailyBreakfast} kcal')
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset('assets/images/lunch.png', width: 42.0),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          const Expanded(
              child: Text('Almuerzo', style: TextStyle(fontSize: 18.0))),
          Text('${dailyNutrition.dailyLunch} kcal')
        ]),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset('assets/images/dinner.png', width: 42.0),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          const Expanded(child: Text('Cena', style: TextStyle(fontSize: 18.0))),
          Text('${dailyNutrition.dailyDinner} kcal')
        ])
      ]));
}
