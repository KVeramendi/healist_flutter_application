import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/cereals_data.dart';
import 'package:healist_flutter_application/Data/dairies_data.dart';
import 'package:healist_flutter_application/Data/dried_fruits_data.dart';
import 'package:healist_flutter_application/Data/fruits_data.dart';
import 'package:healist_flutter_application/Data/legumes_data.dart';
import 'package:healist_flutter_application/Data/meats_fish_data.dart';
import 'package:healist_flutter_application/Data/vegetables_data.dart';
import 'package:healist_flutter_application/Model/daily_nutrition_model.dart';
import 'package:healist_flutter_application/Model/food_model.dart';
import 'package:healist_flutter_application/Util/daily_nutrition_preferences.dart';
import 'package:healist_flutter_application/Widget/search_widget.dart';

class FoodListPage extends StatefulWidget {
  final String title;
  const FoodListPage({Key? key, required this.title}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  late List<FoodModel> foodsData;
  late List<FoodModel> foodListSearching;
  late DailyNutritionModel dailyNutrition;
  final _formKey = GlobalKey<FormState>();
  String query = '';

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
      foodsData = allMeatsFish;
      foodListSearching = allMeatsFish;
    } else if (widget.title == 'BEBIDAS') {
      foodsData = allDairies;
      foodListSearching = allDairies;
    } else {
      foodsData = allDairies;
      foodListSearching = allDairies;
    }
    dailyNutrition = DailyNutritionPreferences.getDailyNutrition();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color(0xFF1ECF6C),
              title: Text(widget.title)),
          body: Center(
              child: Column(children: [
            buildSearch(),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      final _currentFood = foodsData[index];
                      return buildFood(_currentFood);
                    },
                    itemCount: foodsData.length))
          ]))));

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

  Widget buildFood(FoodModel currentFood) => ListTile(
      leading: Image.asset(currentFood.foodIcon, width: 45.0, height: 45.0),
      title: Text(currentFood.foodName, style: const TextStyle(fontSize: 22.0)),
      subtitle:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('P: ' + currentFood.proteins.toString() + ' g',
            style:
                TextStyle(color: Colors.blueAccent.shade700, fontSize: 13.0)),
        Text('C: ' + currentFood.carbohydrates.toString() + ' g',
            style: TextStyle(color: Colors.redAccent.shade700, fontSize: 13.0)),
        Text('G: ' + currentFood.fats.toString() + ' g',
            style:
                TextStyle(color: Colors.orangeAccent.shade400, fontSize: 13.0))
      ]),
      trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(currentFood.kilocalories.toString() + ' kcal',
                style: const TextStyle(fontSize: 17.0)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            currentFood.isDrink
                ? Text('ración (${currentFood.foodPortion} ml)',
                    style:
                        const TextStyle(color: Colors.black45, fontSize: 12.0))
                : Text('ración (${currentFood.foodPortion} g)',
                    style:
                        const TextStyle(color: Colors.black45, fontSize: 12.0))
          ]),
      onTap: () => buildShowDialog(currentFood));

  Future<dynamic> buildShowDialog(FoodModel food) {
    final _foodPortionController =
        TextEditingController(text: food.foodPortion.toString());
    String? _meals;
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(food.foodName, style: const TextStyle(fontSize: 18.0)),
                  Image.asset(food.foodIcon, width: 20.0)
                ]),
            titlePadding: const EdgeInsets.all(16.0),
            content: SizedBox(
                width: double.maxFinite,
                child: Form(
                    key: _formKey,
                    child: Wrap(runSpacing: 20.0, children: [
                      TextFormField(
                          controller: _foodPortionController,
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
                      DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem<String>(
                                value: 'Desayuno', child: Text('Desayuno')),
                            DropdownMenuItem<String>(
                                value: 'Almuerzo', child: Text('Almuerzo')),
                            DropdownMenuItem<String>(
                                value: 'Cena', child: Text('Cena')),
                          ].toList(),
                          value: _meals,
                          onChanged: (String? value) =>
                              setState(() => _meals = value),
                          decoration: const InputDecoration(
                              labelText: 'Comida',
                              helperText:
                                  'Seleccione el tipo de comida del día',
                              border: OutlineInputBorder()),
                          validator: (value) => _errorPhysicalActivity(value)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0)),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction)),
            contentPadding: const EdgeInsets.all(16.0),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar',
                      style: TextStyle(
                          color: Colors.grey.shade700, fontSize: 18.0))),
              TextButton(
                  onPressed: () {
                    final _isValid = _formKey.currentState!.validate();
                    if (_isValid) {
                      dailyNutrition = _copyDailyNutrition(
                          food, _foodPortionController.text, _meals!);
                      DailyNutritionPreferences.setDailyNutrition(
                          dailyNutrition);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Agregar',
                      style:
                          TextStyle(color: Color(0xFF1ECF6C), fontSize: 18.0)))
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        barrierDismissible: false);
  }

  String? _errorPhysicalActivity(Object? text) =>
      text == null ? 'Debe ingresar el tipo de comida del día' : null;

  DailyNutritionModel _copyDailyNutrition(
      FoodModel food, String text, String meal) {
    final DailyNutritionModel lastDailyNutrition =
        DailyNutritionPreferences.getDailyNutrition();
    final _currentDailyNutrition = dailyNutrition.copy(
      dailyWater: food.isDrink
          ? lastDailyNutrition.dailyWater + (double.parse(text) / 1000)
          : lastDailyNutrition.dailyWater,
      dailyKilocalories:
          lastDailyNutrition.dailyKilocalories + food.kilocalories,
      dailyFruitsVegetables:
          widget.title == 'FRUTAS' || widget.title == 'VERDURAS'
              ? lastDailyNutrition.dailyFruitsVegetables + int.parse(text)
              : lastDailyNutrition.dailyFruitsVegetables,
      dailyProteins: lastDailyNutrition.dailyProteins + food.proteins,
      dailyCarbohydrates:
          lastDailyNutrition.dailyCarbohydrates + food.carbohydrates,
      dailyFats: lastDailyNutrition.dailyFats + food.fats,
      dailyBreakfast: meal == 'Desayuno'
          ? lastDailyNutrition.dailyBreakfast + food.kilocalories
          : lastDailyNutrition.dailyBreakfast,
      dailyLunch: meal == 'Almuerzo'
          ? lastDailyNutrition.dailyLunch + food.kilocalories
          : lastDailyNutrition.dailyLunch,
      dailyDinner: meal == 'Cena'
          ? lastDailyNutrition.dailyDinner + food.kilocalories
          : lastDailyNutrition.dailyDinner,
    );
    return _currentDailyNutrition;
  }
}
