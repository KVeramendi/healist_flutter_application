import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healist_flutter_application/Data/food_data.dart';
import 'package:healist_flutter_application/Model/food_model.dart';
import 'package:healist_flutter_application/Widget/category_card_button_widget.dart';
import 'package:healist_flutter_application/Widget/search_widget.dart';

class FoodCategoryPage extends StatefulWidget {
  const FoodCategoryPage({Key? key}) : super(key: key);

  @override
  State<FoodCategoryPage> createState() => _FoodCategoryPageState();
}

class _FoodCategoryPageState extends State<FoodCategoryPage> {
  late List<Food> foodsData;
  String query = '';
  String? _meals;
  bool isButtonsVisible = true;
  bool isFoodsVisible = false;

  @override
  void initState() {
    super.initState();
    foodsData = allFoods;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildSearch(),
          if (isButtonsVisible)
            const CategoryCardButtonWidget(
                backgroundImage: AssetImage(
                    'assets/images/categories/fruits_background.jpg'),
                iconImage: AssetImage('assets/images/categories/fruits.png'),
                text: 'FRUTAS'),
          if (isButtonsVisible)
            const CategoryCardButtonWidget(
                backgroundImage: AssetImage(
                    'assets/images/categories/vegetables_background.jpg'),
                iconImage:
                    AssetImage('assets/images/categories/vegetables.png'),
                text: 'VERDURAS'),
          if (isButtonsVisible)
            const CategoryCardButtonWidget(
                backgroundImage: AssetImage(
                    'assets/images/categories/legumes_background.jpg'),
                iconImage: AssetImage('assets/images/categories/legumes.png'),
                text: 'LEGUMBRES'),
          if (isButtonsVisible)
            const CategoryCardButtonWidget(
                backgroundImage: AssetImage(
                    'assets/images/categories/dairies_background.jpg'),
                iconImage: AssetImage('assets/images/categories/dairies.png'),
                text: 'LÁCTEOS'),
          if (isButtonsVisible)
            const CategoryCardButtonWidget(
                backgroundImage: AssetImage(
                    'assets/images/categories/cereals_background.jpg'),
                iconImage: AssetImage('assets/images/categories/cereals.png'),
                text: 'CEREALES'),
          if (isButtonsVisible)
            const CategoryCardButtonWidget(
                backgroundImage: AssetImage(
                    'assets/images/categories/dried_fruits_background.jpg'),
                iconImage:
                    AssetImage('assets/images/categories/dried_fruits.png'),
                text: 'FRUTOS SECOS'),
          const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          if (isFoodsVisible)
            Expanded(
                child: ListView.builder(
                    itemCount: foodsData.length,
                    itemBuilder: (context, index) {
                      final food = foodsData[index];
                      return buildFood(food);
                    }))
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
      text: query, hintText: 'Nombre del alimento', onChanged: searchFood);

  void searchFood(String query) {
    if (query != '') {
      final foods = allFoods.where((food) {
        final foodNameLower = food.foodName.toLowerCase();
        final searchLower = query.toLowerCase();
        return foodNameLower.contains(searchLower);
      }).toList();
      setState(() {
        this.query = query;
        foodsData = foods;
        isButtonsVisible = false;
        isFoodsVisible = true;
      });
    } else {
      setState(() {
        isButtonsVisible = true;
        isFoodsVisible = false;
      });
    }
  }

  Widget buildFood(Food food) {
    final _kilocaloriesController =
        TextEditingController(text: food.foodPortion.toString());
    return ListTile(
        leading: Image.asset(food.foodIcon,
            fit: BoxFit.cover, width: 50.0, height: 50.0),
        title: Text(food.foodName, style: const TextStyle(fontSize: 22.0)),
        subtitle:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('P: ' + food.proteins.toString() + ' g',
              style:
                  TextStyle(color: Colors.blueAccent.shade700, fontSize: 14.0)),
          Text('C: ' + food.carbohydrates.toString() + ' g',
              style:
                  TextStyle(color: Colors.redAccent.shade700, fontSize: 14.0)),
          Text('G: ' + food.fats.toString() + ' g',
              style: TextStyle(
                  color: Colors.orangeAccent.shade400, fontSize: 14.0))
        ]),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.0)),
                                SizedBox(
                                    width: 25.0,
                                    child: Image.asset(food.foodIcon))
                              ]),
                          content:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            TextFormField(
                                controller: _kilocaloriesController,
                                decoration: InputDecoration(
                                    labelText: 'Cantidad',
                                    helperText: '1 ración = ' +
                                        food.foodPortion.toString() +
                                        ' gramos',
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
                                      value: 'C', child: Text('Cena'))
                                ].toList(),
                                value: _meals,
                                onChanged: (String? value) {
                                  setState(() {
                                    _meals = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Comida',
                                    border: OutlineInputBorder()))
                          ]),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancelar'),
                                child: const Text('Cancelar')),
                            TextButton(
                                onPressed: () => Navigator.pop(
                                    context, _kilocaloriesController.text),
                                child: const Text('Agregar'))
                          ]),
                  barrierDismissible: false)
              .then((result) => print(result));
        });
  }
}
