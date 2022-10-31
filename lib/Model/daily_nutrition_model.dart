class DailyNutritionModel {
  final double dailyWater;
  final int dailyKilocalories;
  final int dailyFruitsVegetables;
  final double dailyProteins;
  final double dailyCarbohydrates;
  final double dailyFats;
  final int dailyBreakfast;
  final int dailyLunch;
  final int dailyDinner;

  DailyNutritionModel(
      {required this.dailyWater,
      required this.dailyKilocalories,
      required this.dailyFruitsVegetables,
      required this.dailyProteins,
      required this.dailyCarbohydrates,
      required this.dailyFats,
      required this.dailyBreakfast,
      required this.dailyLunch,
      required this.dailyDinner});

  DailyNutritionModel copy(
          {double? dailyWater,
          int? dailyKilocalories,
          int? dailyFruitsVegetables,
          double? dailyProteins,
          double? dailyCarbohydrates,
          double? dailyFats,
          int? dailyBreakfast,
          int? dailyLunch,
          int? dailyDinner}) =>
      DailyNutritionModel(
          dailyWater: dailyWater ?? this.dailyWater,
          dailyKilocalories: dailyKilocalories ?? this.dailyKilocalories,
          dailyFruitsVegetables:
              dailyFruitsVegetables ?? this.dailyFruitsVegetables,
          dailyProteins: dailyProteins ?? this.dailyProteins,
          dailyCarbohydrates: dailyCarbohydrates ?? this.dailyCarbohydrates,
          dailyFats: dailyFats ?? this.dailyFats,
          dailyBreakfast: dailyBreakfast ?? this.dailyBreakfast,
          dailyLunch: dailyLunch ?? this.dailyLunch,
          dailyDinner: dailyDinner ?? this.dailyDinner);

  Map<String, dynamic> toJson() => {
        'dailyWater': dailyWater,
        'dailyKilocalories': dailyKilocalories,
        'dailyFruitsVegetables': dailyFruitsVegetables,
        'dailyProteins': dailyProteins,
        'dailyCarbohydrates': dailyCarbohydrates,
        'dailyFats': dailyFats,
        'dailyBreakfast': dailyBreakfast,
        'dailyLunch': dailyLunch,
        'dailyDinner': dailyDinner
      };

  static DailyNutritionModel fromJson(Map<String, dynamic> json) =>
      DailyNutritionModel(
          dailyWater: json['dailyWater'],
          dailyKilocalories: json['dailyKilocalories'],
          dailyFruitsVegetables: json['dailyFruitsVegetables'],
          dailyProteins: json['dailyProteins'],
          dailyCarbohydrates: json['dailyCarbohydrates'],
          dailyFats: json['dailyFats'],
          dailyBreakfast: json['dailyBreakfast'],
          dailyLunch: json['dailyLunch'],
          dailyDinner: json['dailyDinner']);
}
