import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healist_flutter_application/Data/cereals_data.dart';
import 'package:healist_flutter_application/Data/dairies_data.dart';
import 'package:healist_flutter_application/Data/dried_fruits_data.dart';
import 'package:healist_flutter_application/Data/drinks_data.dart';
import 'package:healist_flutter_application/Data/fruits_data.dart';
import 'package:healist_flutter_application/Data/legumes_data.dart';
import 'package:healist_flutter_application/Data/meats_fish_data.dart';
import 'package:healist_flutter_application/Data/other_foods_data.dart';
import 'package:healist_flutter_application/Data/vegetables_data.dart';
import 'package:healist_flutter_application/Model/chart_nutrition_model.dart';
import 'package:healist_flutter_application/Model/daily_nutrition_model.dart';
import 'package:healist_flutter_application/Model/food_model.dart';
import 'package:healist_flutter_application/Util/chart_nutrition_preferences.dart';
import 'package:healist_flutter_application/Util/daily_nutrition_preferences.dart';
import 'package:healist_flutter_application/Widget/search_widget.dart';

class FoodListPage extends StatefulWidget {
  final String title;
  const FoodListPage({Key? key, required this.title}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  late List<ChartNutritionModel> chartNutritionModelList;
  late List<FoodModel> foodsData, foodListSearching;
  late DailyNutritionModel dailyNutrition;
  final _formKey = GlobalKey<FormState>();
  String query = '';

  @override
  void initState() {
    super.initState();
    chartNutritionModelList = ChartNutritionPreferences.getChartNutrition();
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
      foodsData = allDrinks;
      foodListSearching = allDrinks;
    } else {
      foodsData = allOtherFoods;
      foodListSearching = allOtherFoods;
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
            SearchWidget(text: query, onChanged: searchFood),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      final _currentFood = foodsData[index];
                      return buildFood(_currentFood);
                    },
                    itemCount: foodsData.length))
          ]))));

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
    final _rationController = TextEditingController(text: "1");
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
                      TextFormField(
                          controller: _rationController,
                          decoration: InputDecoration(
                              labelText: 'Ración',
                              helperText: food.isDrink
                                  ? '1 ración es equivalente a 1 vaso'
                                  : '1 ración es equivalente a 1 taza',
                              border: const OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          validator: (value) => _errorRation(value!),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                      TextFormField(
                          controller: _foodPortionController,
                          decoration: InputDecoration(
                              labelText: 'Cantidad (g)',
                              helperText: food.isDrink
                                  ? 'Cant. predeterminada: ${food.foodPortion} ml (1 ración)'
                                  : 'Cant. predeterminada: ${food.foodPortion} g (1 ración)',
                              border: const OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          validator: (value) => _errorFoodPortion(value!),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ]),
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
                          food,
                          int.parse(_foodPortionController.text),
                          int.parse(_rationController.text),
                          _meals!);
                      DailyNutritionPreferences.setDailyNutrition(
                          dailyNutrition);
                      ChartNutritionPreferences.setChartNutrition(
                          _copyLastChartNutritionItem(
                              food,
                              int.parse(_foodPortionController.text),
                              int.parse(_rationController.text)));
                      buildSnackBar();
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

  List<ChartNutritionModel> _copyLastChartNutritionItem(
      FoodModel food, int currentPortion, int ration) {
    final _lastChartNutrition = chartNutritionModelList.removeLast();
    chartNutritionModelList.add(ChartNutritionModel(
        dateTime: _lastChartNutrition.dateTime,
        kilocaloriesConsumption: _lastChartNutrition.kilocaloriesConsumption +
            _getKilocaloriesbyPortion(food, currentPortion, ration),
        proteinsIntake: _lastChartNutrition.proteinsIntake +
            _getNutrientsbyPortion(
                food.proteins, food.foodPortion, currentPortion, ration),
        carbohydratesIntake: _lastChartNutrition.proteinsIntake +
            _getNutrientsbyPortion(
                food.carbohydrates, food.foodPortion, currentPortion, ration),
        fatsIntake: _lastChartNutrition.fatsIntake +
            _getNutrientsbyPortion(
                food.fats, food.foodPortion, currentPortion, ration),
        waterConsumption: food.isDrink && widget.title != 'BEBIDAS'
            ? _lastChartNutrition.waterConsumption +
                ((currentPortion / 1000) * ration)
            : _lastChartNutrition.waterConsumption,
        fruitsVegetablesIntake:
            widget.title == 'FRUTAS' || widget.title == 'VERDURAS'
                ? _lastChartNutrition.fruitsVegetablesIntake +
                    (currentPortion * ration)
                : _lastChartNutrition.fruitsVegetablesIntake));
    return chartNutritionModelList;
  }

  DailyNutritionModel _copyDailyNutrition(
      FoodModel food, int currentPortion, int ration, String meal) {
    final _lastDailyNutrition = DailyNutritionPreferences.getDailyNutrition();
    final _currentDailyNutrition = dailyNutrition.copy(
        dailyWater: food.isDrink && widget.title != 'BEBIDAS'
            ? _lastDailyNutrition.dailyWater +
                ((currentPortion / 1000) * ration)
            : _lastDailyNutrition.dailyWater,
        dailyKilocalories: _lastDailyNutrition.dailyKilocalories +
            _getKilocaloriesbyPortion(food, currentPortion, ration),
        dailyFruitsVegetables:
            widget.title == 'FRUTAS' || widget.title == 'VERDURAS'
                ? _lastDailyNutrition.dailyFruitsVegetables +
                    (currentPortion * ration)
                : _lastDailyNutrition.dailyFruitsVegetables,
        dailyProteins: _lastDailyNutrition.dailyProteins +
            _getNutrientsbyPortion(
                food.proteins, food.foodPortion, currentPortion, ration),
        dailyCarbohydrates: _lastDailyNutrition.dailyCarbohydrates +
            _getNutrientsbyPortion(
                food.carbohydrates, food.foodPortion, currentPortion, ration),
        dailyFats: _lastDailyNutrition.dailyFats +
            _getNutrientsbyPortion(
                food.fats, food.foodPortion, currentPortion, ration),
        dailyBreakfast: meal == 'Desayuno'
            ? _lastDailyNutrition.dailyBreakfast +
                _getKilocaloriesbyPortion(food, currentPortion, ration)
            : _lastDailyNutrition.dailyBreakfast,
        dailyLunch: meal == 'Almuerzo'
            ? _lastDailyNutrition.dailyLunch +
                _getKilocaloriesbyPortion(food, currentPortion, ration)
            : _lastDailyNutrition.dailyLunch,
        dailyDinner: meal == 'Cena'
            ? _lastDailyNutrition.dailyDinner +
                _getKilocaloriesbyPortion(food, currentPortion, ration)
            : _lastDailyNutrition.dailyDinner);
    return _currentDailyNutrition;
  }

  int _getKilocaloriesbyPortion(
          FoodModel food, int currentPortion, int ration) =>
      ((food.kilocalories * currentPortion) / food.foodPortion).round() *
      ration;

  double _getNutrientsbyPortion(double foodNutrient, int foodPortion,
          int currentPortion, int ration) =>
      ((foodNutrient * currentPortion) / foodPortion) * ration;

  String? _errorPhysicalActivity(Object? text) =>
      text == null ? 'Debe ingresar el tipo de comida del día' : null;

  String? _errorRation(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar una cantidad de la ración';
    }
    final _value = int.parse(text);
    if (_value < 1) {
      return 'La cantidad debe ser mayor a cero';
    }
    if (_value > 99) {
      return 'El valor ingresado no es válido';
    }
    return null;
  }

  String? _errorFoodPortion(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar una cantidad del alimento';
    }
    final _value = int.parse(text);
    if (_value < 1) {
      return 'La cantidad debe ser mayor a cero';
    }
    if (_value > 9999) {
      return 'El valor ingresado no es válido';
    }
    return null;
  }

  ScaffoldMessengerState buildSnackBar() => ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Row(children: const [
          Icon(Icons.check_circle_rounded, color: Colors.white),
          Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
          Expanded(
              child: Text('Alimento guardado con éxito',
                  style: TextStyle(fontSize: 18.0)))
        ]),
        backgroundColor: const Color(0xFF1ECF6C),
        elevation: 0,
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3)));
}
