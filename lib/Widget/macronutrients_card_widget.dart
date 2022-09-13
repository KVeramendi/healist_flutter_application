import 'package:flutter/material.dart';

class MacronutrientsCardWidget extends StatefulWidget {
  const MacronutrientsCardWidget({Key? key}) : super(key: key);

  @override
  State<MacronutrientsCardWidget> createState() =>
      _MacronutrientsCardWidgetState();
}

class _MacronutrientsCardWidgetState extends State<MacronutrientsCardWidget> {
  final double _initialProteinsValue = 45.6;
  final double _lastProteinsValue = 51.8;
  final double _goalProteinsValue = 75.0;
  final double _subtractionValuesP = 6.2;
  final double _initialCarbohydratesValue = 210.6;
  final double _lastCarbohydratesValue = 232.9;
  final double _goalCarbohydratesValue = 300.0;
  final double _subtractionValuesC = 22.3;
  final double _initialFatsValue = 96.7;
  final double _lastFatsValue = 85.5;
  final double _goalFatsValue = 80.0;
  final double _subtractionValuesF = 11.2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Expanded(
            child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: SizedBox(
                    height: 80.0,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_initialProteinsValue g',
                                        style: const TextStyle(fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Inicio',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15.0))
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_lastProteinsValue g',
                                        style: const TextStyle(fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Último',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15.0))
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_goalProteinsValue g',
                                        style: TextStyle(
                                            color: Colors.blueAccent.shade700,
                                            fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Objetivo',
                                        style: TextStyle(
                                            color: Colors.blueAccent.shade700,
                                            fontSize: 15.0))
                                  ])
                            ])))))
      ]),
      Row(children: [
        Expanded(
            child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: SizedBox(
                    height: 80.0,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            text:
                                                'Aumentó el consumo de proteínas en '),
                                        TextSpan(
                                            text:
                                                '$_subtractionValuesP gramos ',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                            text:
                                                'desde un inicio hasta la última fecha registrada.')
                                      ],
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16.0,
                                          fontFamily: 'Mali')),
                                  textAlign: TextAlign.justify)
                            ])))))
      ]),
      Row(children: [
        Expanded(
            child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: SizedBox(
                    height: 80.0,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_initialCarbohydratesValue g',
                                        style: const TextStyle(fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Inicio',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15.0))
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_lastCarbohydratesValue g',
                                        style: const TextStyle(fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Último',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15.0))
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_goalCarbohydratesValue g',
                                        style: TextStyle(
                                            color: Colors.redAccent.shade700,
                                            fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Objetivo',
                                        style: TextStyle(
                                            color: Colors.redAccent.shade700,
                                            fontSize: 15.0))
                                  ])
                            ])))))
      ]),
      Row(children: [
        Expanded(
            child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: SizedBox(
                    height: 80.0,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            text:
                                                'Aumentó el consumo de carbohidratos en '),
                                        TextSpan(
                                            text:
                                                '$_subtractionValuesC gramos ',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                            text:
                                                'desde un inicio hasta la última fecha registrada.')
                                      ],
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16.0,
                                          fontFamily: 'Mali')),
                                  textAlign: TextAlign.justify)
                            ])))))
      ]),
      Row(children: [
        Expanded(
            child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: SizedBox(
                    height: 80.0,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_initialFatsValue g',
                                        style: const TextStyle(fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Inicio',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15.0))
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_lastFatsValue g',
                                        style: const TextStyle(fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Último',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15.0))
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$_goalFatsValue g',
                                        style: TextStyle(
                                            color: Colors.orangeAccent.shade400,
                                            fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Objetivo',
                                        style: TextStyle(
                                            color: Colors.orangeAccent.shade400,
                                            fontSize: 15.0))
                                  ]),
                            ])))))
      ]),
      Row(children: [
        Expanded(
            child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: SizedBox(
                    height: 80.0,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            text:
                                                'Disminuyó el consumo de grasas en '),
                                        TextSpan(
                                            text:
                                                '$_subtractionValuesF gramos ',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                            text:
                                                'desde un inicio hasta la última fecha registrada.')
                                      ],
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16.0,
                                          fontFamily: 'Mali')),
                                  textAlign: TextAlign.justify)
                            ])))))
      ])
    ]);
  }
}
