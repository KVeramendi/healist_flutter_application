import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Sidebar/Setting/change_password_page.dart';
import 'package:healist_flutter_application/View/Sidebar/Setting/setting_edit_page.dart';
import 'package:healist_flutter_application/Widget/custom_appbar_widget.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Scaffold(
        appBar: const CustomAppBarWidget(title: 'Configuración'),
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
            children: [
              buildSettingHeader(user.userImagePath, user.fullName, user.email),
              const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
              buildSettingButtons()
            ]));
  }

  Widget buildSettingHeader(String image, String name, String email) {
    final imageUrl = image.contains('assets/')
        ? AssetImage(image)
        : FileImage(File(image)) as ImageProvider;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Stack(children: [
        ClipOval(
            child: Material(
                color: Colors.transparent,
                child: Ink.image(
                    image: imageUrl,
                    fit: BoxFit.cover,
                    width: 112.0,
                    height: 112.0,
                    child: InkWell(onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SettingEditPage()));
                      setState(() {});
                    })))),
        Positioned(
            right: 0,
            bottom: 0,
            child: ClipOval(
                child: Container(
                    padding: const EdgeInsets.all(3.0),
                    color: Colors.white,
                    child: ClipOval(
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: const Color(0xFF1ECF6C),
                            child: const Icon(Icons.edit_rounded,
                                color: Colors.white))))))
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(name, style: const TextStyle(fontSize: 15.0)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Text(email, style: const TextStyle(fontSize: 13.0))
      ])
    ]);
  }

  Widget buildSettingButtons() => Column(children: [
        CustomElevateButtonWidget(
            height: 50,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChangePasswordPage())),
            backgroundColor: Colors.black87,
            text: 'Cambiar contraseña',
            textSize: 20.0),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
        CustomElevateButtonWidget(
            width: 200.0,
            height: 50.0,
            onPressed: () async => await buildShowDialog(),
            backgroundColor: Colors.grey.shade300,
            text: 'Borrar cuenta',
            textColor: Colors.redAccent.shade700,
            textSize: 20.0)
      ]);

  buildShowDialog() async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text('Borrar cuenta de usuario',
              style: TextStyle(fontSize: 18.0)),
          titlePadding: const EdgeInsets.all(16.0),
          content: Text(
              '* Todos los datos serán borrados permanentemente (Perfil de usuario, las imágenes e información de los alimentos).',
              style: TextStyle(color: Colors.redAccent.shade700)),
          contentPadding: const EdgeInsets.all(16.0),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                autofocus: true,
                child: const Text('Cancelar')),
            TextButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.redAccent.shade700),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)))),
                child: const Text('Borrar ahora',
                    style: TextStyle(color: Colors.white)))
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)))),
      barrierDismissible: false);
}
