import 'package:flutter/material.dart';

class KilocaloriesCardWidget extends StatefulWidget {
  const KilocaloriesCardWidget({Key? key}) : super(key: key);

  @override
  State<KilocaloriesCardWidget> createState() => _KilocaloriesCardWidgetState();
}

class _KilocaloriesCardWidgetState extends State<KilocaloriesCardWidget> {
  final int _initialKilocaloriesValue = 2930;
  final int _lastKilocaloriesValue = 2788;
  final int _goalKilocaloriesValue = 2500;
  final int _subtractionValues = 142;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
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
                            Text('$_initialKilocaloriesValue kcal',
                                style: const TextStyle(fontSize: 22.0)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text('Inicio',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15.0))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$_lastKilocaloriesValue kcal',
                                style: const TextStyle(fontSize: 22.0)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text('Último',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15.0))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$_goalKilocaloriesValue kcal',
                                style: TextStyle(
                                    color: Colors.greenAccent.shade700,
                                    fontSize: 22.0)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text('Objetivo',
                                style: TextStyle(
                                    color: Colors.greenAccent.shade700,
                                    fontSize: 15.0))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
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
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 16.0),
                                children: [
                                  const TextSpan(
                                      text:
                                          'Disminuyó el consumo calórico en '),
                                  TextSpan(
                                      text: '$_subtractionValues kilocalorías ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(
                                      text:
                                          'desde un inicio hasta la última fecha registrada.'),
                                ]),
                            textAlign: TextAlign.justify),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
