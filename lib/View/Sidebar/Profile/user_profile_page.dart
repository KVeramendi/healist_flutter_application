import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Sidebar/Profile/user_profile_edit_page.dart';
import 'package:healist_flutter_application/Widget/custom_appbar_widget.dart';
import 'package:healist_flutter_application/Widget/custom_textfield_widget.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Scaffold(
        appBar: CustomAppBarWidget(title: 'Perfil de usuario', actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserProfileEditPage()));
                setState(() {});
              },
              icon: const Icon(Icons.edit_rounded, color: Color(0xFF1ECF6C)))
        ]),
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            children: [
              buildUserHeader(user.userImagePath, user.fullName, user.email),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              buildUserInfo(user.weight, user.height, user.age,
                  user.physicalActivity, user.gender)
            ]));
  }

  Widget buildUserHeader(String image, String name, String email) {
    final imageUrl = image.contains('assets/')
        ? AssetImage(image)
        : FileImage(File(image)) as ImageProvider;
    return Center(
        child: Column(children: [
      CircleAvatar(backgroundImage: imageUrl, radius: 55.0),
      const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Text(name,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
      Text(email, style: TextStyle(color: Colors.grey.shade600))
    ]));
  }

  Widget buildUserInfo(double weight, double height, int age,
          String physicalActivity, String gender) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextFieldWidget(
            label: 'Peso', text: '$weight kg', readOnly: true),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        CustomTextFieldWidget(
            label: 'Altura', text: '$height cm', readOnly: true),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        CustomTextFieldWidget(label: 'Edad', text: '$age años', readOnly: true),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        CustomTextFieldWidget(
            label: 'Nivel de actividad física',
            text: physicalActivity,
            readOnly: true),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        CustomTextFieldWidget(label: 'Género', text: gender, readOnly: true)
      ]);
}
