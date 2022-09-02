class Food {
  final int id;
  final String foodName;
  final int foodPortion;
  final int kilocalories;
  final double proteins;
  final double carbohydrates;
  final double fats;
  final String foodIcon;
  final String urlImage;

  const Food({
    required this.id,
    required this.foodName,
    required this.foodPortion,
    required this.kilocalories,
    required this.proteins,
    required this.carbohydrates,
    required this.fats,
    required this.foodIcon,
    required this.urlImage,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
      id: json['id'],
      foodName: json['foodName'],
      foodPortion: json['foodPortion'],
      kilocalories: json['kilocalories'],
      proteins: json['proteins'],
      carbohydrates: json['carbohydrates'],
      fats: json['fats'],
      foodIcon: json['foodIcon'],
      urlImage: json['urlImage']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'foodName': foodName,
        'foodPortion': foodPortion,
        'kilocalories': kilocalories,
        'proteins': proteins,
        'carbohydrates': carbohydrates,
        'fats': fats,
        'foodIcon': foodIcon,
        'urlImage': urlImage
      };
}
