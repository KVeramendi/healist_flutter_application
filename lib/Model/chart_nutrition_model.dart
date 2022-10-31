class ChartNutritionModel {
  final DateTime dateTime;
  final int kilocaloriesConsumption;
  final double proteinsIntake;
  final double carbohydratesIntake;
  final double fatsIntake;
  final double waterConsumption;
  final int fruitsVegetablesIntake;

  ChartNutritionModel(
      {required this.dateTime,
      required this.kilocaloriesConsumption,
      required this.proteinsIntake,
      required this.carbohydratesIntake,
      required this.fatsIntake,
      required this.waterConsumption,
      required this.fruitsVegetablesIntake});

  ChartNutritionModel copy(
          {DateTime? dateTime,
          int? kilocaloriesConsumption,
          double? proteinsIntake,
          double? carbohydratesIntake,
          double? fatsIntake,
          double? waterConsumption,
          int? fruitsVegetablesIntake}) =>
      ChartNutritionModel(
          dateTime: dateTime ?? this.dateTime,
          kilocaloriesConsumption:
              kilocaloriesConsumption ?? this.kilocaloriesConsumption,
          proteinsIntake: proteinsIntake ?? this.proteinsIntake,
          carbohydratesIntake: carbohydratesIntake ?? this.carbohydratesIntake,
          fatsIntake: fatsIntake ?? this.fatsIntake,
          waterConsumption: waterConsumption ?? this.waterConsumption,
          fruitsVegetablesIntake:
              fruitsVegetablesIntake ?? this.fruitsVegetablesIntake);

  Map<String, dynamic> toJson() => {
        'dateTime': dateTime.toIso8601String(),
        'kilocaloriesConsumption': kilocaloriesConsumption,
        'proteinsIntake': proteinsIntake,
        'carbohydratesIntake': carbohydratesIntake,
        'fatsIntake': fatsIntake,
        'waterConsumption': waterConsumption,
        'fruitsVegetablesIntake': fruitsVegetablesIntake
      };

  static ChartNutritionModel fromJson(Map<String, dynamic> json) =>
      ChartNutritionModel(
          dateTime: DateTime.tryParse(json['dateTime'])!,
          kilocaloriesConsumption: json['kilocaloriesConsumption'],
          proteinsIntake: json['proteinsIntake'],
          carbohydratesIntake: json['carbohydratesIntake'],
          fatsIntake: json['fatsIntake'],
          waterConsumption: json['waterConsumption'],
          fruitsVegetablesIntake: json['fruitsVegetablesIntake']);

  @override
  String toString() {
    return 'datetime: $dateTime\nkilocaloriesConsumption: $kilocaloriesConsumption\nproteinsIntake: $proteinsIntake\ncarbohydratesIntake: $carbohydratesIntake\nfatsIntake: $fatsIntake\nwaterConsumption: $waterConsumption\nfruitsVegetablesIntake: $fruitsVegetablesIntake\n';
  }
}
