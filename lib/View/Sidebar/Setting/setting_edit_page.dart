import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/Widget/custom_appbar_widget.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';
import 'package:healist_flutter_application/Widget/custom_textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SettingEditPage extends StatefulWidget {
  const SettingEditPage({Key? key}) : super(key: key);

  @override
  State<SettingEditPage> createState() => _SettingEditPageState();
}

class _SettingEditPageState extends State<SettingEditPage> {
  late UserModel user, userInitialState;
  File? image;

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
    userInitialState = user;
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = user.userImagePath.contains('assets/')
        ? AssetImage(user.userImagePath)
        : FileImage(File(user.userImagePath)) as ImageProvider;
    return WillPopScope(
        child: Scaffold(
            appBar: const CustomAppBarWidget(),
            body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 40.0),
                children: [
                  Center(
                      child: Stack(children: [
                    CircleAvatar(
                        child: ClipOval(
                            child: Material(
                                color: Colors.transparent,
                                child: Ink.image(
                                    image: imageUrl,
                                    fit: BoxFit.cover,
                                    child: InkWell(onTap: () => pickImge())))),
                        backgroundColor: Colors.transparent,
                        radius: 100.0),
                    Positioned(
                        right: 0.0,
                        bottom: 0,
                        child: ClipOval(
                            child: Container(
                                padding: const EdgeInsets.all(3.0),
                                color: Colors.white,
                                child: ClipOval(
                                    child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        color: const Color(0xFF1ECF6C),
                                        child: const Icon(
                                            Icons.add_a_photo_rounded,
                                            size: 36.0,
                                            color: Colors.white))))))
                  ])),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                  CustomTextFieldWidget(
                      label: 'Nombre completo',
                      text: user.fullName,
                      onChanged: (value) => user = user.copy(fullName: value),
                      keyboardType: TextInputType.name),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  CustomTextFieldWidget(
                      label: 'Correo electrónico',
                      text: user.email,
                      onChanged: (value) => user = user.copy(email: value),
                      keyboardType: TextInputType.emailAddress),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                  CustomElevateButtonWidget(
                      height: 50,
                      onPressed: () {
                        UserPreferences.setUser(user);
                        buildSnackBar();
                        Navigator.of(context).pop();
                      },
                      text: 'Guardar cambios')
                ])),
        onWillPop: () async {
          final _pageModified = user.hashCode != userInitialState.hashCode;
          if (_pageModified) {
            final shoulPop = await showWarning(context);
            return shoulPop ?? false;
          } else {
            return true;
          }
        });
  }

  Future pickImge() async {
    try {
      final _currentImageSource =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_currentImageSource == null) return;
      final _newImage = await saveImagePermanently(_currentImageSource.path);
      setState(() {
        image = _newImage;
        user = user.copy(userImagePath: image?.path);
      });
    } on PlatformException catch (e) {
      throw 'Error al seleccionar la imagen: $e';
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final _directory = await getApplicationDocumentsDirectory();
    final _imageName = basename(imagePath);
    final _newImagePath = File('${_directory.path}/$_imageName');
    return File(imagePath).copy(_newImagePath.path);
  }

  ScaffoldMessengerState buildSnackBar() => ScaffoldMessenger.of(this.context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Row(children: const [
          Icon(Icons.check_circle_rounded, color: Colors.white),
          Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
          Expanded(
              child: Text('Datos guardados con éxito',
                  style: TextStyle(fontSize: 18.0)))
        ]),
        backgroundColor: const Color(0xFF1ECF6C),
        elevation: 0,
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3)));

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
              title: const Text('¿Deseas descartar los cambios realizados?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    autofocus: true,
                    child: const Text('No', style: TextStyle(fontSize: 18.0))),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Sí', style: TextStyle(fontSize: 18.0)))
              ]));
}
