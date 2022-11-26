class UserModel {
  final String fullName;
  final String email;
  final String password;
  final double weight;
  final double height;
  final int age;
  final String physicalActivity;
  final String gender;
  final double water;
  final double kilocalories;
  final int fruitsVegetables;
  final double proteins;
  final double carbohydrates;
  final double fats;
  final String userImagePath;
  final bool closedSession;

  UserModel(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.weight,
      required this.height,
      required this.age,
      required this.physicalActivity,
      required this.gender,
      required this.water,
      required this.kilocalories,
      required this.fruitsVegetables,
      required this.proteins,
      required this.carbohydrates,
      required this.fats,
      required this.userImagePath,
      required this.closedSession});

  double get recommendedKilocalories => gender == 'Femenino'
      ? ((665.096 + (9.563 * weight) + (1.850 * height) - (4.676 * age)) *
          physicalActivityValue(physicalActivity))
      : ((66.473 + (13.752 * weight) + (5.003 * height) - (6.776 * age)) *
          physicalActivityValue(physicalActivity));

  double get recommendedProteins => (recommendedKilocalories * 0.15) / 4;

  double get recommendedCarbohydrates => (recommendedKilocalories * 0.55) / 4;

  double get recommendedFats => (recommendedKilocalories * 0.30) / 9;

  double get recommendedWater => 2.0;

  int get recommendedFruitsVegetables => 400;

  double physicalActivityValue(String physicalActivityValue) {
    if (physicalActivityValue == 'Muy ligera') {
      return 1.2;
    } else if (physicalActivityValue == 'Ligera') {
      return 1.375;
    } else if (physicalActivityValue == 'Regular') {
      return 1.55;
    } else if (physicalActivityValue == 'Activa') {
      return 1.725;
    } else {
      return 1.9;
    }
  }

  UserModel copy(
          {String? fullName,
          String? email,
          String? password,
          double? weight,
          double? height,
          int? age,
          String? physicalActivity,
          String? gender,
          double? water,
          double? kilocalories,
          int? fruitsVegetables,
          double? proteins,
          double? carbohydrates,
          double? fats,
          String? userImagePath,
          bool? closedSession}) =>
      UserModel(
          fullName: fullName ?? this.fullName,
          email: email ?? this.email,
          password: password ?? this.password,
          weight: weight ?? this.weight,
          height: height ?? this.height,
          age: age ?? this.age,
          physicalActivity: physicalActivity ?? this.physicalActivity,
          gender: gender ?? this.gender,
          water: water ?? this.water,
          kilocalories: kilocalories ?? this.kilocalories,
          fruitsVegetables: fruitsVegetables ?? this.fruitsVegetables,
          proteins: proteins ?? this.proteins,
          carbohydrates: carbohydrates ?? this.carbohydrates,
          fats: fats ?? this.fats,
          userImagePath: userImagePath ?? this.userImagePath,
          closedSession: closedSession ?? this.closedSession);

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'password': password,
        'weight': weight,
        'height': height,
        'age': age,
        'physicalActivity': physicalActivity,
        'gender': gender,
        'water': water,
        'kilocalories': kilocalories,
        'fruitsVegetables': fruitsVegetables,
        'proteins': proteins,
        'carbohydrates': carbohydrates,
        'fats': fats,
        'userImagePath': userImagePath,
        'closedSession': closedSession
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      weight: json['weight'],
      height: json['height'],
      age: json['age'],
      physicalActivity: json['physicalActivity'],
      gender: json['gender'],
      water: json['water'],
      kilocalories: json['kilocalories'],
      fruitsVegetables: json['fruitsVegetables'],
      proteins: json['proteins'],
      carbohydrates: json['carbohydrates'],
      fats: json['fats'],
      userImagePath: json['userImagePath'],
      closedSession: json['closedSession']);
}
