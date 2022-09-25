import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/Widget/custom_appbar_widget.dart';
import 'package:healist_flutter_application/Widget/custom_textfield_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late User user, userInitialState;
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController1 = TextEditingController();
  final TextEditingController _newPasswordController2 = TextEditingController();
  late String oldPassword;

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
    userInitialState = user;
    oldPassword = user.password;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Scaffold(
            appBar: const CustomAppBarWidget(),
            body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 40.0),
                children: [
                  CustomTextFieldWidget(
                      controller: _currentPasswordController,
                      label: 'Contraseña anterior',
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  CustomTextFieldWidget(
                      controller: _newPasswordController1,
                      label: 'Nueva contraseña',
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  CustomTextFieldWidget(
                      controller: _newPasswordController2,
                      label: 'Confirmar nueva contraseña',
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                  ElevatedButton(
                      onPressed: () {
                        if (oldPassword == _currentPasswordController.text &&
                            _newPasswordController1.text ==
                                _newPasswordController2.text) {
                          user =
                              user.copy(password: _newPasswordController2.text);
                          UserPreferences.setUser(user);
                          Navigator.of(context).pop();
                        } else {
                          print('Las contraseñas no son iguales');
                          print(
                              '$oldPassword != ${_currentPasswordController.text}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent.shade700,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          padding: const EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                      child: const Text('Guardar cambios',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)))
                ])),
        onWillPop: () async {
          final isEditedPage = user.hashCode != userInitialState.hashCode;
          if (isEditedPage) {
            final shoulPop = await showWarning(context);
            return shoulPop ?? false;
          } else {
            return true;
          }
        },
      );

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('¿Deseas descartar los cambios realizados?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('No')),
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Sí'))
            ],
          ));
}
