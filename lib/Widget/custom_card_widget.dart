import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final num initialValue;
  final num lastValue;
  final num goalValue;
  final Color goalValueColor;
  final String nutrientText;
  final int decimals;
  final String nutrientUnitText;
  const CustomCardWidget(
      {Key? key,
      required this.initialValue,
      required this.lastValue,
      required this.goalValue,
      this.goalValueColor = const Color(0xFF1ECF6C),
      required this.nutrientText,
      this.decimals = 0,
      required this.nutrientUnitText})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                width: double.maxFinite,
                height: 80.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${initialValue.toStringAsFixed(decimals)} $nutrientUnitText',
                                style: const TextStyle(fontSize: 22.0)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text('Inicio',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15.0))
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${lastValue.toStringAsFixed(decimals)} $nutrientUnitText',
                                style: const TextStyle(fontSize: 22.0)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text('Último',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15.0))
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${goalValue.toStringAsFixed(decimals)} $nutrientUnitText',
                                style: TextStyle(
                                    color: goalValueColor, fontSize: 22.0)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text('Objetivo',
                                style: TextStyle(
                                    color: goalValueColor, fontSize: 15.0))
                          ])
                    ]))),
        Card(
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
                                    TextSpan(
                                        text: _getResultingText(
                                            initialValue - lastValue,
                                            nutrientText)),
                                    TextSpan(
                                        text:
                                            '${(initialValue - lastValue).abs().toStringAsFixed(decimals)} $nutrientUnitText ',
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
                        ]))))
      ]);
}

String _getResultingText(num value, String text) {
  if (value == 0) {
    return 'Se mantuvo el consumo de $text a ';
  }
  if (value < 0) {
    return 'Aumentó el consumo de $text en ';
  }
  return 'Disminuyó el consumo de $text en ';
}
