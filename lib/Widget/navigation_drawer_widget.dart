import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Sidebar/Profile/user_profile_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:
            Column(children: [buildHeader(context), buildMenuItems(context)]));
  }

  Widget buildHeader(BuildContext context) {
    String _initialsOfName = 'KV';
    String _fullName = 'Kevin Veramendi';
    String _userEmail = 'kveramendi18@gmail.com';
    return Container(
        padding: const EdgeInsets.all(25.0),
        color: Colors.greenAccent.shade700,
        width: double.maxFinite,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(_initialsOfName,
                  style: const TextStyle(color: Colors.white, fontSize: 30.0)),
              radius: 42.0),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          Text(_fullName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(_userEmail,
              style: const TextStyle(color: Colors.white, fontSize: 13.0))
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserProfilePage()))),
                  ListTile(
                      leading: const Icon(Icons.settings_rounded),
                      title: const Text('Configuración',
                          style: TextStyle(fontSize: 16.0)),
                      onTap: () {}),
                  ListTile(
                      leading: const Icon(Icons.info_rounded),
                      title: const Text('Sobre Healist',
                          style: TextStyle(fontSize: 16.0)),
                      onTap: () {})
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
