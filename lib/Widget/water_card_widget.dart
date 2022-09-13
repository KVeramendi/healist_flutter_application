import 'package:flutter/material.dart';

class WaterCardWidget extends StatefulWidget {
  const WaterCardWidget({Key? key}) : super(key: key);

  @override
  State<WaterCardWidget> createState() => _WaterCardWidgetState();
}

class _WaterCardWidgetState extends State<WaterCardWidget> {
  final double _initialWaterValue = 0.9;
  final double _lastWaterValue = 1.15;
  final double _goalWaterValue = 1.5;
  final double _subtractionValues = 0.25;

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
                                    Text('$_initialWaterValue L',
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
                                    Text('$_lastWaterValue L',
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
                                    Text('$_goalWaterValue L',
                                        style: TextStyle(
                                            color: Colors.greenAccent.shade700,
                                            fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    Text('Objetivo',
                                        style: TextStyle(
                                            color: Colors.greenAccent.shade700,
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
                                                'Aumentó el consumo de agua en '),
                                        TextSpan(
                                            text: '$_subtractionValues litros ',
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
