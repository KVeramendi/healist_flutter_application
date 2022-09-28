import 'package:flutter/material.dart';

class FruitsVegetablesCardWidget extends StatefulWidget {
  const FruitsVegetablesCardWidget({Key? key}) : super(key: key);

  @override
  State<FruitsVegetablesCardWidget> createState() =>
      _FruitsVegetablesCardWidgetState();
}

class _FruitsVegetablesCardWidgetState
    extends State<FruitsVegetablesCardWidget> {
  final int _initialFruitsVegetablesValue = 225;
  final int _lastFruitsVegetablesValue = 262;
  final int _goalFruitsVegetablesValue = 400;
  final int _subtractionValues = 37;

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
                                    Text('$_initialFruitsVegetablesValue g',
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
                                    Text('$_lastFruitsVegetablesValue g',
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
                                    Text('$_goalFruitsVegetablesValue g',
                                        style: const TextStyle(
                                            color: Color(0xFF1ECF6C),
                                            fontSize: 22.0)),
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0)),
                                    const Text('Objetivo',
                                        style: TextStyle(
                                            color: Color(0xFF1ECF6C),
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
                                                'Aumentó el consumo de frutas y verduras en '),
                                        TextSpan(
                                            text: '$_subtractionValues gramos ',
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
