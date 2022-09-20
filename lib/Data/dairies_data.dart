import 'package:healist_flutter_application/Model/food_model.dart';

final allDairies = <Food>[
  Food(
      id: 1,
      foodName: 'Dulce de leche',
      foodPortion: 19,
      kilocalories: 60,
      proteins: 1.30,
      carbohydrates: 10.52,
      fats: 1.40,
      foodIcon: 'assets/images/foods/dairies/caramel_sauce.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/dulce-de-leche.jpg'),
  Food(
      id: 2,
      foodName: 'Leche entera',
      foodPortion: 244,
      kilocalories: 102,
      proteins: 8.22,
      carbohydrates: 12.18,
      fats: 2.37,
      foodIcon: 'assets/images/foods/dairies/whole_milk.png',
      isDrink: true,
      imageUrl: 'https://biotrendies.com/wp-content/uploads/2015/07/leche.jpg'),
  Food(
      id: 3,
      foodName: 'Leche desnatada',
      foodPortion: 245,
      kilocalories: 83,
      proteins: 8.26,
      carbohydrates: 12.15,
      fats: 0.20,
      foodIcon: 'assets/images/foods/dairies/skimmed_milk.png',
      isDrink: true,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/leche-desnatada.jpg'),
  Food(
      id: 4,
      foodName: 'Leche semidesnatada',
      foodPortion: 246,
      kilocalories: 123,
      proteins: 8.12,
      carbohydrates: 11.81,
      fats: 4.87,
      foodIcon: 'assets/images/foods/dairies/semiskimmed_milk.png',
      isDrink: true,
      imageUrl: 'https://biotrendies.com/wp-content/uploads/2015/07/leche.jpg'),
  Food(
      id: 5,
      foodName: 'Leche sin lactosa',
      foodPortion: 240,
      kilocalories: 90,
      proteins: 8.00,
      carbohydrates: 13.00,
      fats: 0.00,
      foodIcon: 'assets/images/foods/dairies/lastless_milk.png',
      isDrink: true,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/leche-deslactosada.jpg'),
  Food(
      id: 6,
      foodName: 'Mantequilla',
      foodPortion: 5,
      kilocalories: 36,
      proteins: 0.04,
      carbohydrates: 0.00,
      fats: 4.06,
      foodIcon: 'assets/images/foods/dairies/butter.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/mantequilla.jpg'),
  Food(
      id: 7,
      foodName: 'Queso Azul',
      foodPortion: 28,
      kilocalories: 100,
      proteins: 6.07,
      carbohydrates: 0.66,
      fats: 8.15,
      foodIcon: 'assets/images/foods/dairies/blue_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-azul.jpg'),
  Food(
      id: 8,
      foodName: 'Queso Brie',
      foodPortion: 28,
      kilocalories: 95,
      proteins: 5.88,
      carbohydrates: 0.13,
      fats: 7.85,
      foodIcon: 'assets/images/foods/dairies/brie_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-brie.jpg'),
  Food(
      id: 9,
      foodName: 'Queso Camembert',
      foodPortion: 28,
      kilocalories: 85,
      proteins: 5.61,
      carbohydrates: 0.13,
      fats: 6.88,
      foodIcon: 'assets/images/foods/dairies/camembert_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-camembert.jpg'),
  Food(
      id: 10,
      foodName: 'Queso Cheddar',
      foodPortion: 132,
      kilocalories: 536,
      proteins: 31.73,
      carbohydrates: 1.76,
      fats: 44.64,
      foodIcon: 'assets/images/foods/dairies/cheddar_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-cheddar-1000x600.jpg'),
  Food(
      id: 11,
      foodName: 'Queso Crema',
      foodPortion: 14,
      kilocalories: 50,
      proteins: 0.86,
      carbohydrates: 0.59,
      fats: 4.96,
      foodIcon: 'assets/images/foods/dairies/cream_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/queso-crema-800x600.jpg'),
  Food(
      id: 12,
      foodName: 'Queso de cabra',
      foodPortion: 28,
      kilocalories: 128,
      proteins: 8.65,
      carbohydrates: 0.62,
      fats: 10.09,
      foodIcon: 'assets/images/foods/dairies/goat_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/QUESO-DE-CABRA.jpg'),
  Food(
      id: 13,
      foodName: 'Queso Edam',
      foodPortion: 28,
      kilocalories: 101,
      proteins: 7.08,
      carbohydrates: 0.41,
      fats: 7.88,
      foodIcon: 'assets/images/foods/dairies/edam_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/queso-edam.jpg'),
  Food(
      id: 14,
      foodName: 'Queso Feta',
      foodPortion: 150,
      kilocalories: 396,
      proteins: 21.32,
      carbohydrates: 6.14,
      fats: 31.92,
      foodIcon: 'assets/images/foods/dairies/feta_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-feta.jpg'),
  Food(
      id: 15,
      foodName: 'Queso fresco',
      foodPortion: 122,
      kilocalories: 365,
      proteins: 22.07,
      carbohydrates: 3.64,
      fats: 29.06,
      foodIcon: 'assets/images/foods/dairies/fresh_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/queso-fresco.jpg'),
  Food(
      id: 16,
      foodName: 'Queso Gouda',
      foodPortion: 28,
      kilocalories: 101,
      proteins: 7.07,
      carbohydrates: 0.63,
      fats: 7.78,
      foodIcon: 'assets/images/foods/dairies/gouda_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-gouda-800x600.jpg'),
  Food(
      id: 17,
      foodName: 'Queso Gruyère',
      foodPortion: 28,
      kilocalories: 117,
      proteins: 8.45,
      carbohydrates: 0.10,
      fats: 9.17,
      foodIcon: 'assets/images/foods/dairies/gruyere_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-gruyere-1000x600.jpg'),
  Food(
      id: 18,
      foodName: 'Queso Mozzarella',
      foodPortion: 112,
      kilocalories: 336,
      proteins: 24.83,
      carbohydrates: 2.45,
      fats: 25.03,
      foodIcon: 'assets/images/foods/dairies/mozzarella_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-mozzarella.jpg'),
  Food(
      id: 19,
      foodName: 'Queso Oaxaca',
      foodPortion: 132,
      kilocalories: 470,
      proteins: 29.83,
      carbohydrates: 3.79,
      fats: 37.30,
      foodIcon: 'assets/images/foods/dairies/oaxaca_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/07/queso-oaxaca-858x600.jpg'),
  Food(
      id: 20,
      foodName: 'Queso Parmesano',
      foodPortion: 100,
      kilocalories: 420,
      proteins: 28.42,
      carbohydrates: 13.91,
      fats: 27.84,
      foodIcon: 'assets/images/foods/dairies/parmesan_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-parmesano-1000x600.jpg'),
  Food(
      id: 21,
      foodName: 'Queso Provolone',
      foodPortion: 132,
      kilocalories: 463,
      proteins: 33.77,
      carbohydrates: 2.82,
      fats: 35.14,
      foodIcon: 'assets/images/foods/dairies/provolone_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-provolone.jpg'),
  Food(
      id: 22,
      foodName: 'Queso Ricotta',
      foodPortion: 124,
      kilocalories: 216,
      proteins: 13.96,
      carbohydrates: 3.77,
      fats: 16.10,
      foodIcon: 'assets/images/foods/dairies/ricotta_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-ricotta.jpg'),
  Food(
      id: 23,
      foodName: 'Queso Roquefort',
      foodPortion: 28,
      kilocalories: 105,
      proteins: 6.11,
      carbohydrates: 0.57,
      fats: 8.69,
      foodIcon: 'assets/images/foods/dairies/roquefort_cheese.png',
      isDrink: false,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/queso-roquefort.jpg'),
  Food(
      id: 24,
      foodName: 'Yogur Natural',
      foodPortion: 170,
      kilocalories: 104,
      proteins: 5.90,
      carbohydrates: 7.92,
      fats: 5.52,
      foodIcon: 'assets/images/foods/dairies/natural_yogurt.png',
      isDrink: true,
      imageUrl:
          'https://biotrendies.com/wp-content/uploads/2015/06/Yogurt-natural.jpg'),
];
