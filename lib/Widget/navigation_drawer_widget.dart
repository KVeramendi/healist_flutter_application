import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Sidebar/About/about_healist_page.dart';
import 'package:healist_flutter_application/View/Sidebar/Profile/user_profile_page.dart';
import 'package:healist_flutter_application/View/Sidebar/Setting/setting_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Drawer(
        child: Column(children: [
      buildHeader(user.userImagePath, user.fullName, user.email),
      buildMenuItems(context)
    ]));
  }

  Widget buildHeader(String image, String name, String email) {
    final imageUrl = image.contains('assets/')
        ? AssetImage(image)
        : FileImage(File(image)) as ImageProvider;
    return Container(
        padding: const EdgeInsets.all(25.0),
        color: const Color(0xFF1ECF6C),
        width: double.maxFinite,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(backgroundImage: imageUrl, radius: 50.0),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(email,
              style: const TextStyle(color: Colors.white, fontSize: 14.0))
        ]));
  }

  Widget buildMenuItems(BuildContext context) => Expanded(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(runSpacing: 15.0, children: [
                  ListTile(
                      leading: const Icon(Icons.account_circle_rounded),
                      title: const Text('Perfil',
                          style: TextStyle(fontSize: 16.0)),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserProfilePage()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.settings_rounded),
                      title: const Text('Configuración',
                          style: TextStyle(fontSize: 16.0)),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SettingPage()));
                      }),
                  ListTile(
                      leading: const Icon(Icons.info_rounded),
                      title: const Text('Sobre Healist',
                          style: TextStyle(fontSize: 16.0)),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AboutHealistPage()));
                      })
                ]),
                Wrap(children: [
                  const Divider(thickness: 1.0, color: Colors.black38),
                  ListTile(
                      leading: const Icon(Icons.logout_rounded),
                      title: const Text('Cerrar sesión',
                          style: TextStyle(fontSize: 16.0)),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage())))
                ])
              ])));
}
