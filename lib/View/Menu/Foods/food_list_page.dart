import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Data/food_data.dart';
import 'package:healist_flutter_application/Model/food_model.dart';
import 'package:healist_flutter_application/Widget/search_widget.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  late List<Food> foods;
  String query = '';
  String? _meals;

  @override
  void initState() {
    super.initState();
    foods = allFoods;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildSearch(),
          Expanded(
              child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    food.hashCode;
                    return buildFood(food);
                  }))
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
      text: 'query', hintText: 'Nombre del alimento', onChanged: searchFood);

  void searchFood(String query) {
    final foods = allFoods.where((food) {
      final foodNameLower = food.foodName.toLowerCase();
      final searchLower = query.toLowerCase();
      return foodNameLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.foods = foods;
    });
  }

  Widget buildFood(Food food) {
    final _kilocaloriesController =
        TextEditingController(text: food.foodPortion.toString());
    return ListTile(
      leading: Image.asset(food.foodIcon,
          fit: BoxFit.cover, width: 50.0, height: 50.0),
      title: Text(food.foodName, style: const TextStyle(fontSize: 22.0)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('P: ' + food.proteins.toString() + ' g',
              style:
                  TextStyle(color: Colors.blueAccent.shade700, fontSize: 14.0)),
          Text('C: ' + food.carbohydrates.toString() + ' g',
              style:
                  TextStyle(color: Colors.redAccent.shade700, fontSize: 14.0)),
          Text('G: ' + food.fats.toString() + ' g',
              style: TextStyle(
                  color: Colors.orangeAccent.shade400, fontSize: 14.0))
        ],
      ),
      trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(food.kilocalories.toString() + ' kcal',
                style: const TextStyle(fontSize: 16.0)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text('1 ración (' + food.foodPortion.toString() + ' g)',
                style: const TextStyle(color: Colors.black45, fontSize: 12.0))
          ]),
      onTap: () {
        showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(food.foodName),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0)),
                          SizedBox(
                              width: 25.0, child: Image.asset(food.foodIcon)),
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _kilocaloriesController,
                            decoration: InputDecoration(
                              labelText: 'Cantidad',
                              border: const OutlineInputBorder(),
                              helperText: '1 ración = ' +
                                  food.foodPortion.toString() +
                                  ' gramos',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0)),
                          DropdownButtonFormField(
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'D',
                                child: Text('Desayuno'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'A',
                                child: Text('Almuerzo'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'C',
                                child: Text('Cena'),
                              ),
                            ].toList(),
                            value: _meals,
                            onChanged: (String? value) {
                              setState(() {
                                _meals = value;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Comida',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancelar'),
                            child: const Text('Cancelar')),
                        TextButton(
                            onPressed: () => Navigator.pop(
                                context, _kilocaloriesController.text),
                            child: const Text('Agregar')),
                      ],
                    ),
                barrierDismissible: false)
            .then((result) => print(result));
      },
    );
  }
}
