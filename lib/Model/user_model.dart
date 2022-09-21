class User {
  final String fullName;
  final String email;
  final String password;
  final double weight;
  final double height;
  final int age;
  final String physicalActivity;
  final String gender;
  final String userImagePath;

  User(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.weight,
      required this.height,
      required this.age,
      required this.physicalActivity,
      required this.gender,
      required this.userImagePath});

  User copy(
          {String? fullName,
          String? email,
          String? password,
          double? weight,
          double? height,
          int? age,
          String? physicalActivity,
          String? gender,
          String? userImagePath}) =>
      User(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        age: age ?? this.age,
        physicalActivity: physicalActivity ?? this.physicalActivity,
        gender: gender ?? this.gender,
        userImagePath: userImagePath ?? this.userImagePath,
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'password': password,
        'weight': weight,
        'height': height,
        'age': age,
        'physicalActivity': physicalActivity,
        'gender': gender,
        'userImagePath': userImagePath,
      };

  static User fromJson(Map<String, dynamic> json) => User(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      weight: json['weight'],
      height: json['height'],
      age: json['age'],
      physicalActivity: json['physicalActivity'],
      gender: json['gender'],
      userImagePath: json['userImagePath']);
}
