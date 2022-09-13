import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Widget/fruits_vegetables_card_widget.dart';
import 'package:healist_flutter_application/Widget/fruits_vegetables_chart_widget.dart';
import 'package:healist_flutter_application/Widget/kilocalories_card_widget.dart';
import 'package:healist_flutter_application/Widget/kilocalories_chart_widget.dart';
import 'package:healist_flutter_application/Widget/macronutrients_card_widget.dart';
import 'package:healist_flutter_application/Widget/macronutrients_chart_widget.dart';
import 'package:healist_flutter_application/Widget/water_card_widget.dart';
import 'package:healist_flutter_application/Widget/water_chart_widget.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final _items = [
    'Consumo de kilocalorías',
    'Ingesta de nutrientes',
    'Consumo de agua',
    'Ingesta de frutas y verduras'
  ];
  String? _initialItem = 'Consumo de kilocalorías';
  final List<bool> _isSelected = [true, false];
  int _choiceButton = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                          items: _items.map(buildMenuItem).toList(),
                          value: _initialItem,
                          onChanged: (value) =>
                              setState(() => _initialItem = value),
                          icon: const Icon(Icons.arrow_drop_down, size: 26.0),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
                  SizedBox(
                    height: 38.0,
                    child: ToggleButtons(
                        children: const [
                          Icon(Icons.show_chart_rounded, size: 18.0),
                          Icon(Icons.stacked_line_chart_rounded, size: 18.0)
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
              chartSelection(_initialItem),
              cardSelection(_initialItem),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  Widget chartSelection(String? option) {
    if (option == 'Consumo de kilocalorías') {
      return const KilocaloriesChartWidget();
    } else if (option == 'Ingesta de nutrientes') {
      return const MacronutrientsChartWidget();
    } else if (option == 'Consumo de agua') {
      return const WaterChartWidget();
    } else {
      return const FruitsVegetablesChartWidget();
    }
  }

  Widget cardSelection(String? option) {
    if (option == 'Consumo de kilocalorías') {
      return const KilocaloriesCardWidget();
    } else if (option == 'Ingesta de nutrientes') {
      return const MacronutrientsCardWidget();
    } else if (option == 'Consumo de agua') {
      return const WaterCardWidget();
    } else {
      return const FruitsVegetablesCardWidget();
    }
  }
}
