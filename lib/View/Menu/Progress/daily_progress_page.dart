import 'package:ai_progress/ai_progress.dart';
import 'package:flutter/material.dart';

class DailyProgressPage extends StatefulWidget {
  const DailyProgressPage({Key? key}) : super(key: key);

  @override
  State<DailyProgressPage> createState() => _DailyProgressPageState();
}

class _DailyProgressPageState extends State<DailyProgressPage> {
  final String _waterImageRoute = 'assets/images/water_glass.png';
  final String _goalImageRoute = 'assets/images/goal.png';
  final String _fruitVegetableImageRoute = 'assets/images/fruit_vegetable.png';
  final String _breakfastImageRoute = 'assets/images/breakfast.png';
  final String _lunchImageRoute = 'assets/images/lunch.png';
  final String _dinnerImageRoute = 'assets/images/dinner.png';
  final double _waterValue = 1.2;
  final int _kilocaloriesValue = 1954;
  final int _fruitVegetableValue = 220;
  final double _proteinsValue = 105.0;
  final double _carbohydratesValue = 290.0;
  final double _fatsValue = 80.0;
  final int _breakfastValue = 228;
  final int _lunchValue = 399;
  final int _dinnerValue = 120;

  @override
  Widget build(BuildContext context) {
    final int _kilocaloriesValueText = _kilocaloriesValue.toInt();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          width: 35.0, child: Image.asset(_waterImageRoute)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0)),
                      RotatedBox(
                        quarterTurns: 3,
                        child: SizedBox(
                            width: 80.0,
                            child: LinearProgressIndicator(
                                value: 0.6,
                                backgroundColor: Colors.grey.shade200,
                                color: Colors.greenAccent.shade700,
                                minHeight: 5.5)),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0)),
                      Text('$_waterValue L')
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      AirDashboardStateProgressIndicator(
                          size: const Size(160, 160),
                          min: 0.0,
                          max: 100.0,
                          value: (_kilocaloriesValue / 2500) * 100, //1~100
                          pathColor: Colors.grey.shade200,
                          valueColor: Colors.greenAccent.shade700,
                          pathStrokeWidth: 12.0,
                          valueStrokeWidth: 6.0,
                          gapDegree: 50,
                          roundCap: true),
                      Column(
                        children: [
                          Text('$_kilocaloriesValueText',
                              style: TextStyle(
                                  color: Colors.greenAccent.shade700,
                                  fontSize: 32.0)),
                          const Text('/ 2500',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.0)),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0)),
                          Text('kcal',
                              style: TextStyle(
                                  color: Colors.greenAccent.shade700,
                                  fontSize: 16.0)),
                          const Padding(padding: EdgeInsets.only(bottom: 15.0)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 135.0),
                        child: SizedBox(
                            width: 65.0,
                            child: Image.asset(
                              _goalImageRoute,
                              // color: Colors.greenAccent.shade700,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: 35.0,
                          child: Image.asset(_fruitVegetableImageRoute)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0)),
                      RotatedBox(
                        quarterTurns: 3,
                        child: SizedBox(
                          width: 80.0,
                          child: LinearProgressIndicator(
                              value: 0.6,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.greenAccent.shade700,
                              minHeight: 5.5),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0)),
                      Text('$_fruitVegetableValue g')
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Proteínas',
                          style: TextStyle(color: Colors.blueAccent.shade700)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      SizedBox(
                          width: 80.0,
                          child: LinearProgressIndicator(
                              value: 0.3,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.blueAccent.shade700,
                              minHeight: 5.0)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      Text('$_proteinsValue g',
                          style: TextStyle(color: Colors.blueAccent.shade700))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                  Column(
                    children: [
                      Text('Carbohidratos',
                          style: TextStyle(color: Colors.redAccent.shade700)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      SizedBox(
                          width: 80.0,
                          child: LinearProgressIndicator(
                              value: 0.75,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.redAccent.shade700,
                              minHeight: 5.0)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      Text('$_carbohydratesValue g',
                          style: TextStyle(color: Colors.redAccent.shade700)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                  Column(
                    children: [
                      Text('Grasas',
                          style:
                              TextStyle(color: Colors.orangeAccent.shade400)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      SizedBox(
                          width: 80.0,
                          child: LinearProgressIndicator(
                              value: 0.55,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.orangeAccent.shade400,
                              minHeight: 5.0)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      Text('$_fatsValue g',
                          style:
                              TextStyle(color: Colors.orangeAccent.shade400)),
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
              Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.greenAccent.shade700, width: 2.0)),
                  ),
                  child: const Text('ALIMENTOS',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(_breakfastImageRoute, width: 42.0),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                  const Expanded(
                      child:
                          Text('Desayuno', style: TextStyle(fontSize: 18.0))),
                  Text('$_breakfastValue kcal')
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(_lunchImageRoute, width: 42.0),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                  const Expanded(
                      child:
                          Text('Almuerzo', style: TextStyle(fontSize: 18.0))),
                  Text('$_lunchValue kcal')
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(_dinnerImageRoute, width: 42.0),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                  const Expanded(
                      child: Text('Cena', style: TextStyle(fontSize: 18.0))),
                  Text('$_dinnerValue kcal'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
