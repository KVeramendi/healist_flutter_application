class Food {
  final int id;
  final String foodName;
  final int foodPortion;
  final int kilocalories;
  final double proteins;
  final double carbohydrates;
  final double fats;
  // final String foodSchedule;
  // final int day;
  // final int month;
  // final int year;
  final String foodIcon;
  final bool isDrink;
  final String imageUrl;

  Food({
    required this.id,
    required this.foodName,
    required this.foodPortion,
    required this.kilocalories,
    required this.proteins,
    required this.carbohydrates,
    required this.fats,
    // required this.foodSchedule,
    // required this.day,
    // required this.month,
    // required this.year,
    required this.foodIcon,
    required this.isDrink,
    required this.imageUrl,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
      id: json['id'],
      foodName: json['foodName'],
      foodPortion: json['foodPortion'],
      kilocalories: json['kilocalories'],
      proteins: json['proteins'],
      carbohydrates: json['carbohydrates'],
      fats: json['fats'],
      // foodSchedule: json['foodSchedule'],
      // day: json['day'],
      // month: json['month'],
      // year: json['year'],
      foodIcon: json['foodIcon'],
      isDrink: json['isDrink'],
      imageUrl: json['urlImage']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'foodName': foodName,
        'foodPortion': foodPortion,
        'kilocalories': kilocalories,
        'proteins': proteins,
        'carbohydrates': carbohydrates,
        'fats': fats,
        // 'foodSchedule': foodSchedule,
        // 'day': day,
        // 'month': month,
        // 'year': year,
        'foodIcon': foodIcon,
        'isDrink': isDrink,
        'urlImage': imageUrl
      };
}
