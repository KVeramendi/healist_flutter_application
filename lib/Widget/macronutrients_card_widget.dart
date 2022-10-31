import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/Widget/custom_card_widget.dart';

class MacronutrientsCardWidget extends StatefulWidget {
  const MacronutrientsCardWidget({Key? key}) : super(key: key);

  @override
  State<MacronutrientsCardWidget> createState() =>
      _MacronutrientsCardWidgetState();
}

class _MacronutrientsCardWidgetState extends State<MacronutrientsCardWidget> {
  final _user = UserPreferences.getUser();
  final _chartNutrition = ChartNutritionPreferences.getChartNutrition();
  late final PageController _pageController;
  int _pageViewSelected = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        SizedBox(
            height: 180.0,
            child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  _pageViewSelected = value;
                  setState(() {});
                },
                children: [
                  CustomCardWidget(
                      initialValue: _chartNutrition.first.proteinsIntake,
                      lastValue: _chartNutrition.last.proteinsIntake,
                      goalValue: _user.proteins,
                      goalValueColor: Colors.blueAccent.shade700,
                      nutrientText: 'proteínas',
                      decimals: 1,
                      nutrientUnitText: 'g'),
                  CustomCardWidget(
                      initialValue: _chartNutrition.first.carbohydratesIntake,
                      lastValue: _chartNutrition.last.carbohydratesIntake,
                      goalValue: _user.carbohydrates,
                      goalValueColor: Colors.redAccent.shade700,
                      nutrientText: 'carbohidratos',
                      decimals: 1,
                      nutrientUnitText: 'g'),
                  CustomCardWidget(
                      initialValue: _chartNutrition.first.fatsIntake,
                      lastValue: _chartNutrition.last.fatsIntake,
                      goalValue: _user.fats,
                      goalValueColor: Colors.orangeAccent.shade400,
                      nutrientText: 'grasas',
                      decimals: 1,
                      nutrientUnitText: 'g')
                ])),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Icon(Icons.circle,
                        size: 10.0,
                        color: _pageViewSelected == index
                            ? const Color(0xFF1ECF6C)
                            : Colors.grey.shade300))))
      ]);
}
