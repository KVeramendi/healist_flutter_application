import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Widget/kilocalories_consumption_widget.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final items = [
    'Consumo de kilocalorías',
    'Ingesta de nutrientes',
    'Consumo de agua',
    'Ingesta de frutas y verduras'
  ];
  String? initialItem = 'Consumo de kilocalorías';
  final List<bool> _isSelected = [true, false];
  final int _initialKilocaloriesValue = 2960;
  final int _lastKilocaloriesValue = 2680;
  final int _goalKilocaloriesValue = 2500;
  int? value = 280;
  int _choiceButton = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.greenAccent.shade700, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0)),
                      height: 40.0,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          items: items.map(buildMenuItem).toList(),
                          value: initialItem,
                          onChanged: (value) =>
                              setState(() => initialItem = value),
                          icon: const Icon(Icons.arrow_drop_down, size: 30.0),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                  SizedBox(
                    height: 38.0,
                    child: ToggleButtons(
                        children: const [
                          Icon(Icons.show_chart_rounded, size: 20.0),
                          Icon(Icons.stacked_line_chart_rounded, size: 16.0)
                        ],
                        isSelected: _isSelected,
                        onPressed: (newIndex) => setState(() {
                              for (int index = 0;
                                  index < _isSelected.length;
                                  index++) {
                                if (index == newIndex) {
                                  _isSelected[index] = true;
                                } else {
                                  _isSelected[index] = false;
                                }
                              }
                            }),
                        color: Colors.grey,
                        selectedColor: Colors.white,
                        fillColor: Colors.greenAccent.shade700,
                        borderColor: Colors.greenAccent.shade700,
                        borderRadius: BorderRadius.circular(8.0),
                        borderWidth: 1.5,
                        selectedBorderColor: Colors.greenAccent.shade700),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceChip(
                      label: const Text('1 S'),
                      labelStyle: _choiceButton == 0
                          ? const TextStyle(color: Colors.white)
                          : const TextStyle(color: Colors.black45),
                      onSelected: (_) => setState(() => _choiceButton = 0),
                      selected: _choiceButton == 0 ? true : false,
                      selectedColor: Colors.greenAccent.shade700,
                      side: BorderSide(color: Colors.greenAccent.shade700),
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      shadowColor: Colors.transparent),
                  ChoiceChip(
                      label: const Text('1 M'),
                      labelStyle: _choiceButton == 1
                          ? const TextStyle(color: Colors.white)
                          : const TextStyle(color: Colors.black45),
                      onSelected: (_) => setState(() => _choiceButton = 1),
                      selected: _choiceButton == 1 ? true : false,
                      selectedColor: Colors.greenAccent.shade700,
                      side: BorderSide(color: Colors.greenAccent.shade700),
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      shadowColor: Colors.transparent),
                  ChoiceChip(
                      label: const Text('3 M'),
                      labelStyle: _choiceButton == 2
                          ? const TextStyle(color: Colors.white)
                          : const TextStyle(color: Colors.black45),
                      onSelected: (_) => setState(() => _choiceButton = 2),
                      selected: _choiceButton == 2 ? true : false,
                      selectedColor: Colors.greenAccent.shade700,
                      side: BorderSide(color: Colors.greenAccent.shade700),
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      shadowColor: Colors.transparent),
                  ChoiceChip(
                      label: const Text('6 M'),
                      labelStyle: _choiceButton == 3
                          ? const TextStyle(color: Colors.white)
                          : const TextStyle(color: Colors.black45),
                      onSelected: (_) => setState(() => _choiceButton = 3),
                      selected: _choiceButton == 3 ? true : false,
                      selectedColor: Colors.greenAccent.shade700,
                      side: BorderSide(color: Colors.greenAccent.shade700),
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      shadowColor: Colors.transparent),
                  ChoiceChip(
                      label: const Text('1 A'),
                      labelStyle: _choiceButton == 4
                          ? const TextStyle(color: Colors.white)
                          : const TextStyle(color: Colors.black45),
                      onSelected: (_) => setState(() => _choiceButton = 4),
                      selected: _choiceButton == 4 ? true : false,
                      selectedColor: Colors.greenAccent.shade700,
                      side: BorderSide(color: Colors.greenAccent.shade700),
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      shadowColor: Colors.transparent)
                ],
              ),
              const KilocaloriesConsumptionWidget(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$_initialKilocaloriesValue kcal',
                                      style: const TextStyle(fontSize: 22.0)),
                                  const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),
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
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
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
                                          color: Colors.black87,
                                          fontSize: 16.0),
                                      children: [
                                        const TextSpan(
                                            text:
                                                'Disminuyó el consumo calórico en '),
                                        TextSpan(
                                            text: '$value kilocalorías',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                            text:
                                                ' desde un inicio hasta la última fecha registrada.'),
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
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
