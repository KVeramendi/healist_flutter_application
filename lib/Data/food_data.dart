import 'package:healist_flutter_application/Model/food_model.dart';

final allFoods = <Food>[
  Food(
      id: 1,
      foodName: 'Aguacate',
      foodPortion: 150,
      kilocalories: 240,
      proteins: 3.00,
      carbohydrates: 12.80,
      fats: 21.99,
      foodIcon: 'assets/images/foods/fruits/avocado.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/aguacate.jpg'),
  Food(
      id: 2,
      foodName: 'Albaricoque',
      foodPortion: 155,
      kilocalories: 74,
      proteins: 2.17,
      carbohydrates: 17.24,
      fats: 0.60,
      foodIcon: 'assets/images/foods/fruits/apricot.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/Albaricoque.jpg'),
  Food(
      id: 3,
      foodName: 'Arándano',
      foodPortion: 148,
      kilocalories: 84,
      proteins: 1.10,
      carbohydrates: 21.45,
      fats: 0.49,
      foodIcon: 'assets/images/foods/fruits/blueberry.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/arandanos.jpg'),
  Food(
      id: 4,
      foodName: 'Arándano rojo',
      foodPortion: 110,
      kilocalories: 51,
      proteins: 0.43,
      carbohydrates: 13.42,
      fats: 0.14,
      foodIcon: 'assets/images/foods/fruits/cranberry.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/Arandano-Rojo.jpg'),
  Food(
      id: 5,
      foodName: 'Asaí',
      foodPortion: 100,
      kilocalories: 60,
      proteins: 2.00,
      carbohydrates: 6.00,
      fats: 5.00,
      foodIcon: 'assets/images/foods/fruits/acai_berry.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/asa%C3%AD.jpg'),
  Food(
      id: 6,
      foodName: 'Caqui',
      foodPortion: 25,
      kilocalories: 32,
      proteins: 0.20,
      carbohydrates: 8.38,
      fats: 0.10,
      foodIcon: 'assets/images/foods/fruits/persimmon.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2016/11/caqui-propiedades.jpg'),
  Food(
      id: 7,
      foodName: 'Carambola',
      foodPortion: 132,
      kilocalories: 41,
      proteins: 1.37,
      carbohydrates: 8.88,
      fats: 0.44,
      foodIcon: 'assets/images/foods/fruits/star_fruit.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Carmabola.jpg'),
  Food(
      id: 8,
      foodName: 'Cereza',
      foodPortion: 155,
      kilocalories: 78,
      proteins: 1.55,
      carbohydrates: 18.88,
      fats: 0.46,
      foodIcon: 'assets/images/foods/fruits/cherry.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/cereza.jpg'),
  Food(
      id: 9,
      foodName: 'Ciruela',
      foodPortion: 165,
      kilocalories: 76,
      proteins: 1.15,
      carbohydrates: 18.84,
      fats: 0.46,
      foodIcon: 'assets/images/foods/fruits/plum.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/ciruela.jpg'),
  Food(
      id: 10,
      foodName: 'Coco',
      foodPortion: 80,
      kilocalories: 283,
      proteins: 2.66,
      carbohydrates: 12.18,
      fats: 26.79,
      foodIcon: 'assets/images/foods/fruits/coconut.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/08/coco.jpg'),
  Food(
      id: 11,
      foodName: 'Frambuesa',
      foodPortion: 123,
      kilocalories: 64,
      proteins: 1.48,
      carbohydrates: 14.69,
      fats: 0.80,
      foodIcon: 'assets/images/foods/fruits/raspberry.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/Frambuesas.jpg'),
  Food(
      id: 12,
      foodName: 'Fresa',
      foodPortion: 152,
      kilocalories: 49,
      proteins: 1.02,
      carbohydrates: 11.67,
      fats: 0.46,
      foodIcon: 'assets/images/foods/fruits/strawberry.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/07/Fresa.jpg'),
  Food(
      id: 13,
      foodName: 'Granada',
      foodPortion: 87,
      kilocalories: 72,
      proteins: 1.45,
      carbohydrates: 16.27,
      fats: 1.02,
      foodIcon: 'assets/images/foods/fruits/pomegranate.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Granada.jpg'),
  Food(
      id: 14,
      foodName: 'Grosella negra',
      foodPortion: 112,
      kilocalories: 71,
      proteins: 1.57,
      carbohydrates: 17.23,
      fats: 0.46,
      foodIcon: 'assets/images/foods/fruits/black_currant.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Grosella-negra.jpg'),
  Food(
      id: 15,
      foodName: 'Guayaba',
      foodPortion: 165,
      kilocalories: 112,
      proteins: 4.21,
      carbohydrates: 23.63,
      fats: 1.57,
      foodIcon: 'assets/images/foods/fruits/guava.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2016/08/guayaba.jpg'),
  Food(
      id: 16,
      foodName: 'Higo',
      foodPortion: 64,
      kilocalories: 47,
      proteins: 0.48,
      carbohydrates: 12.28,
      fats: 0.19,
      foodIcon: 'assets/images/foods/fruits/fig.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/06/Higos.jpg'),
  Food(
      id: 17,
      foodName: 'Kiwi',
      foodPortion: 180,
      kilocalories: 110,
      proteins: 2.05,
      carbohydrates: 26.39,
      fats: 0.94,
      foodIcon: 'assets/images/foods/fruits/kiwi.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/06/kiwi.jpg'),
  Food(
      id: 18,
      foodName: 'Lima',
      foodPortion: 67,
      kilocalories: 20,
      proteins: 0.50,
      carbohydrates: 7.10,
      fats: 0.10,
      foodIcon: 'assets/images/foods/fruits/lime.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/07/Lima.jpg'),
  Food(
      id: 19,
      foodName: 'Limón',
      foodPortion: 212,
      kilocalories: 61,
      proteins: 2.33,
      carbohydrates: 19.76,
      fats: 0.64,
      foodIcon: 'assets/images/foods/fruits/lemon.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Lim%C3%B3n.png'),
  Food(
      id: 20,
      foodName: 'Litchi',
      foodPortion: 190,
      kilocalories: 125,
      proteins: 1.58,
      carbohydrates: 31.41,
      fats: 0.84,
      foodIcon: 'assets/images/foods/fruits/lychee.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2016/01/litchi.jpg'),
  Food(
      id: 21,
      foodName: 'Mandarina',
      foodPortion: 195,
      kilocalories: 103,
      proteins: 1.58,
      carbohydrates: 26.01,
      fats: 0.60,
      foodIcon: 'assets/images/foods/fruits/mandarin.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/mandarina.jpg'),
  Food(
      id: 22,
      foodName: 'Mango',
      foodPortion: 165,
      kilocalories: 99,
      proteins: 1.35,
      carbohydrates: 24.72,
      fats: 0.63,
      foodIcon: 'assets/images/foods/fruits/mango.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/mango1.jpg'),
  Food(
      id: 23,
      foodName: 'Manzana',
      foodPortion: 110,
      kilocalories: 53,
      proteins: 0.30,
      carbohydrates: 14.04,
      fats: 0.14,
      foodIcon: 'assets/images/foods/fruits/apple.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/manzana.jpg'),
  Food(
      id: 24,
      foodName: 'Melocotón',
      foodPortion: 154,
      kilocalories: 60,
      proteins: 1.40,
      carbohydrates: 14.69,
      fats: 0.38,
      foodIcon: 'assets/images/foods/fruits/peach.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/Melocot%C3%B3n.jpg'),
  Food(
      id: 25,
      foodName: 'Melón',
      foodPortion: 177,
      kilocalories: 60,
      proteins: 1.49,
      carbohydrates: 14.44,
      fats: 0.34,
      foodIcon: 'assets/images/foods/fruits/cantaloupe.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/Mel%C3%B3n.jpg'),
  Food(
      id: 26,
      foodName: 'Membrillo',
      foodPortion: 92,
      kilocalories: 52,
      proteins: 0.37,
      carbohydrates: 14.08,
      fats: 0.09,
      foodIcon: 'assets/images/foods/fruits/quince.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/membrillo-859x600.jpg'),
  Food(
      id: 27,
      foodName: 'Zarzamora',
      foodPortion: 144,
      kilocalories: 62,
      proteins: 2.00,
      carbohydrates: 13.84,
      fats: 0.71,
      foodIcon: 'assets/images/foods/fruits/blackberry.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/06/moras.jpg'),
  Food(
      id: 28,
      foodName: 'Naranja',
      foodPortion: 180,
      kilocalories: 85,
      proteins: 1.69,
      carbohydrates: 21.15,
      fats: 0.22,
      foodIcon: 'assets/images/foods/fruits/orange.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Naranja1.jpg'),
  Food(
      id: 29,
      foodName: 'Nectarina',
      foodPortion: 143,
      kilocalories: 63,
      proteins: 1.52,
      carbohydrates: 15.09,
      fats: 0.46,
      foodIcon: 'assets/images/foods/fruits/nectarine.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/Nectarina.jpg'),
  Food(
      id: 30,
      foodName: 'Níspero',
      foodPortion: 149,
      kilocalories: 70,
      proteins: 0.64,
      carbohydrates: 18.09,
      fats: 0.30,
      foodIcon: 'assets/images/foods/fruits/medlar.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2016/01/nisperos.jpg'),
  Food(
      id: 31,
      foodName: 'Papaya',
      foodPortion: 145,
      kilocalories: 62,
      proteins: 0.68,
      carbohydrates: 15.69,
      fats: 0.38,
      foodIcon: 'assets/images/foods/fruits/papaya.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Papaya.jpg'),
  Food(
      id: 32,
      foodName: 'Pera',
      foodPortion: 140,
      kilocalories: 80,
      proteins: 0.50,
      carbohydrates: 21.32,
      fats: 0.20,
      foodIcon: 'assets/images/foods/fruits/pear.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/07/Pera.jpg'),
  Food(
      id: 33,
      foodName: 'Piña',
      foodPortion: 165,
      kilocalories: 82,
      proteins: 0.89,
      carbohydrates: 21.65,
      fats: 0.20,
      foodIcon: 'assets/images/foods/fruits/pineapple.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/06/Pi%C3%B1a-700x600.jpg'),
  Food(
      id: 34,
      foodName: 'Plátano',
      foodPortion: 225,
      kilocalories: 200,
      proteins: 2.45,
      carbohydrates: 51.39,
      fats: 0.74,
      foodIcon: 'assets/images/foods/fruits/banana.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Pl%C3%A1tano.jpg'),
  Food(
      id: 35,
      foodName: 'Pomelo',
      foodPortion: 230,
      kilocalories: 97,
      proteins: 1.77,
      carbohydrates: 24.52,
      fats: 0.32,
      foodIcon: 'assets/images/foods/fruits/grapefruit.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/POMELO.jpg'),
  Food(
      id: 36,
      foodName: 'Ruibarbo',
      foodPortion: 122,
      kilocalories: 26,
      proteins: 1.10,
      carbohydrates: 5.54,
      fats: 0.24,
      foodIcon: 'assets/images/foods/fruits/rhubarb.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Ruibarbo.jpg'),
  Food(
      id: 37,
      foodName: 'Sandia',
      foodPortion: 154,
      kilocalories: 46,
      proteins: 0.94,
      carbohydrates: 11.63,
      fats: 0.23,
      foodIcon: 'assets/images/foods/fruits/watermelon.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/Sandia.jpg'),
  Food(
      id: 38,
      foodName: 'Uva',
      foodPortion: 92,
      kilocalories: 62,
      proteins: 0.58,
      carbohydrates: 15.78,
      fats: 0.32,
      foodIcon: 'assets/images/foods/fruits/grape.png',
      urlImage: 'https://biotrendies.com/wp-content/uploads/2015/07/uva.jpg'),
  Food(
      id: 39,
      foodName: 'Uva espina',
      foodPortion: 150,
      kilocalories: 66,
      proteins: 1.32,
      carbohydrates: 15.27,
      fats: 0.87,
      foodIcon: 'assets/images/foods/fruits/currant.png',
      urlImage:
          'https://biotrendies.com/wp-content/uploads/2015/07/uva-espina.jpg'),
];
