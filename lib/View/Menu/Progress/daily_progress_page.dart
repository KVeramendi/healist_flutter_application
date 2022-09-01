import 'package:ai_progress/ai_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyProgressPage extends StatefulWidget {
  const DailyProgressPage({Key? key}) : super(key: key);

  @override
  State<DailyProgressPage> createState() => _DailyProgressPageState();
}

class _DailyProgressPageState extends State<DailyProgressPage> {
  final String _imageRoute_1 = 'assets/images/water_glass.png';
  final double _waterValue = 1.2;
  final String _imageRoute_2 = 'assets/images/fruit_vegetable.png';
  final int _fruitVegetableValue = 220;
  final String _textProteins = 'Proteínas';
  final String _textCarbohydrates = 'Carbohidratos';
  final String _textFats = 'Grasas';
  final int _proteinsValue = 105;
  final int _carbohydratesValue = 290;
  final int _fatsValue = 80;
  final String _subTittlePage = 'ALIMENTOS';
  final String _imageRoute_3 = 'assets/images/breakfast.png';
  final String _textBreakfast = 'Desayuno';
  final int _breakfastValue = 228;
  final String _imageRoute_4 = 'assets/images/lunch.png';
  final String _textLunch = 'Almuerzo';
  final int _lunchValue = 399;
  final String _imageRoute_5 = 'assets/images/dinner.png';
  final String _textDinner = 'Cena';
  final int _dinnerValue = 120;
  final double _kilocaloriesValue = 1954;
  final String _imageRoute_6 = 'assets/images/goal.png';

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
                      SizedBox(width: 35.0, child: Image.asset(_imageRoute_1)),
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
                      Text('$_waterValue l')
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
                              _imageRoute_6,
                              // color: Colors.greenAccent.shade700,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(width: 35.0, child: Image.asset(_imageRoute_2)),
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
                      Text(_textProteins,
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
                      Text(_textCarbohydrates,
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
                      Text(_textFats,
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
                  child: Text(_subTittlePage,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.0, child: Image.asset(_imageRoute_3)),
                  SizedBox(
                    width: 200.0,
                    child: Text(_textBreakfast, textAlign: TextAlign.left),
                  ),
                  Text('$_breakfastValue kcal')
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.0, child: Image.asset(_imageRoute_4)),
                  SizedBox(
                    width: 200.0,
                    child: Text(_textLunch, textAlign: TextAlign.left),
                  ),
                  Text('$_lunchValue kcal')
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.0, child: Image.asset(_imageRoute_5)),
                  SizedBox(
                    width: 200.0,
                    child: Text(_textDinner, textAlign: TextAlign.left),
                  ),
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
