import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/cereals_data.dart';
import 'package:healist_flutter_application/Data/dairies_data.dart';
import 'package:healist_flutter_application/Data/dried_fruits_data.dart';
import 'package:healist_flutter_application/Data/fruits_data.dart';
import 'package:healist_flutter_application/Data/legumes_data.dart';
import 'package:healist_flutter_application/Data/vegetables_data.dart';
import 'package:healist_flutter_application/Model/food_model.dart';
import 'package:healist_flutter_application/Widget/search_widget.dart';

class FoodListPage extends StatefulWidget {
  final String title;
  const FoodListPage({Key? key, required this.title}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  late List<Food> foodsData;
  late List<Food> foodListSearching;
  String query = '';
  String? _meals;

  @override
  void initState() {
    super.initState();
    if (widget.title == 'FRUTAS') {
      foodsData = allFruits;
      foodListSearching = allFruits;
    } else if (widget.title == 'VERDURAS') {
      foodsData = allVegetables;
      foodListSearching = allVegetables;
    } else if (widget.title == 'FRUTOS SECOS') {
      foodsData = allDriedFruits;
      foodListSearching = allDriedFruits;
    } else if (widget.title == 'LEGUMBRES') {
      foodsData = allLegumes;
      foodListSearching = allLegumes;
    } else if (widget.title == 'CEREALES') {
      foodsData = allCereals;
      foodListSearching = allCereals;
    } else if (widget.title == 'LÁCTEOS') {
      foodsData = allDairies;
      foodListSearching = allDairies;
    } else if (widget.title == 'CARNES Y PESCADOS') {
      foodsData = allDairies;
      foodListSearching = allDairies;
    } else if (widget.title == 'BEBIDAS') {
      foodsData = allDairies;
      foodListSearching = allDairies;
    } else {
      foodsData = allDairies;
      foodListSearching = allDairies;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.greenAccent.shade700,
                title: Text(widget.title)),
            body: Center(
                child: Column(children: [
              buildSearch(),
              Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        final food = foodsData[index];
                        return buildFood(food);
                      },
                      itemCount: foodsData.length))
            ]))));
  }

  Widget buildSearch() => SearchWidget(
      text: query, hintText: 'Nombre del alimento', onChanged: searchFood);

  void searchFood(String query) {
    final foods = foodListSearching.where((food) {
      final foodNameLower = food.foodName.toLowerCase();
      final searchLower = query.toLowerCase();
      return foodNameLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      foodsData = foods;
    });
  }

  Widget buildFood(Food food) {
    final _kilocaloriesController =
        TextEditingController(text: food.foodPortion.toString());
    return ListTile(
        leading: Image.asset(food.foodIcon, width: 45.0, height: 45.0),
        title: Text(food.foodName, style: const TextStyle(fontSize: 22.0)),
        subtitle:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('P: ' + food.proteins.toString() + ' g',
              style:
                  TextStyle(color: Colors.blueAccent.shade700, fontSize: 13.0)),
          Text('C: ' + food.carbohydrates.toString() + ' g',
              style:
                  TextStyle(color: Colors.redAccent.shade700, fontSize: 13.0)),
          Text('G: ' + food.fats.toString() + ' g',
              style: TextStyle(
                  color: Colors.orangeAccent.shade400, fontSize: 13.0))
        ]),
        trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(food.kilocalories.toString() + ' kcal',
                  style: const TextStyle(fontSize: 17.0)),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              food.isDrink
                  ? Text('ración (${food.foodPortion} ml)',
                      style: const TextStyle(
                          color: Colors.black45, fontSize: 12.0))
                  : Text('ración (${food.foodPortion} g)',
                      style: const TextStyle(
                          color: Colors.black45, fontSize: 12.0))
            ]),
        onTap: () {
          showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(food.foodName,
                                style: const TextStyle(fontSize: 18.0)),
                            Image.asset(
                              food.foodIcon,
                              width: 20.0,
                            )
                          ]),
                      titlePadding: const EdgeInsets.all(16.0),
                      content: SizedBox(
                        width: double.maxFinite,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          TextFormField(
                              controller: _kilocaloriesController,
                              decoration: InputDecoration(
                                  labelText: 'Cantidad',
                                  helperText: food.isDrink
                                      ? '1 ración = ${food.foodPortion} ml'
                                      : '1 ración = ${food.foodPortion} g',
                                  counterText: food.isDrink
                                      ? '1 vaso ≈ 250 ml'
                                      : '1 porción ≈ 175 g',
                                  border: const OutlineInputBorder()),
                              keyboardType: TextInputType.number),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0)),
                          DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'D', child: Text('Desayuno')),
                                DropdownMenuItem<String>(
                                    value: 'A', child: Text('Almuerzo')),
                                DropdownMenuItem<String>(
                                    value: 'C', child: Text('Cena')),
                              ].toList(),
                              value: _meals,
                              onChanged: (String? value) {
                                setState(() {
                                  _meals = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Comida',
                                  helperText:
                                      'Seleccione el tipo de comida del día',
                                  border: OutlineInputBorder()))
                        ]),
                      ),
                      contentPadding: const EdgeInsets.all(16.0),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancelar'),
                            child: const Text('Cancelar')),
                        TextButton(
                            onPressed: () => Navigator.pop(
                                context, _kilocaloriesController.text),
                            child: const Text('Agregar'))
                      ],
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                  barrierDismissible: false)
              .then((result) => print(result));
        });
  }
}
