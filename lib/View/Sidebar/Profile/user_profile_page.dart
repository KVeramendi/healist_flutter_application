import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Sidebar/Profile/user_profile_edit_page.dart';
import 'package:healist_flutter_application/Widget/user_profile_textfield_widget.dart';

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
      appBar: buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: [
          buildUserHeader(user.userImagePath, user.fullName, user.email),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          buildUserInfo(user.weight, user.height, user.age,
              user.physicalActivity, user.gender)
        ],
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
      leading: const BackButton(color: Colors.black),
      actions: [
        IconButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserProfileEditPage()));
              setState(() {});
            },
            icon: const Icon(Icons.edit_rounded, color: Colors.black))
      ],
      elevation: 0,
      backgroundColor: Colors.transparent);

  Widget buildUserHeader(String image, String name, String email) {
    final imageUrl = image.contains('https://')
        ? NetworkImage(image)
        : FileImage(File(image));
    return Center(
        child: Column(children: [
      CircleAvatar(
        child: ClipOval(
            child: Image(image: imageUrl as ImageProvider, fit: BoxFit.cover)),
        radius: 50.0,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
      Text(name,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
      Text(email, style: TextStyle(color: Colors.grey.shade600))
    ]));
  }

  Widget buildUserInfo(double weight, double height, int age,
          String physicalActivity, String gender) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        UserProfileTextFieldWidget(
            label: 'Peso', text: '$weight kg', isEditable: false),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        UserProfileTextFieldWidget(
            label: 'Altura', text: '$height cm', isEditable: false),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        UserProfileTextFieldWidget(
            label: 'Edad', text: '$age años', isEditable: false),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        UserProfileTextFieldWidget(
            label: 'Nivel de actividad física',
            text: physicalActivity,
            isEditable: false),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        UserProfileTextFieldWidget(
            label: 'Género', text: gender, isEditable: false)
      ]);
}
