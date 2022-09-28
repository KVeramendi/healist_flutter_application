import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/Widget/custom_appbar_widget.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';
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
                  CustomElevateButtonWidget(
                      height: 50,
                      onPressed: () {
                        final _oldPasswordValidation =
                            oldPassword == _currentPasswordController.text;
                        final _newPasswordsValidation =
                            _newPasswordController1.text ==
                                _newPasswordController2.text;
                        if ((!_oldPasswordValidation &&
                                !_newPasswordsValidation) ||
                            _currentPasswordController.text.isEmpty &&
                                (_newPasswordController1.text.isEmpty &&
                                    _newPasswordController2.text.isEmpty)) {
                          buildSnackBar(
                              false, 'Los valores ingresados son incorrectos.');
                        } else if (!_oldPasswordValidation) {
                          buildSnackBar(
                              false, 'La contraseña anterior no coincide.');
                        } else if (!_newPasswordsValidation) {
                          buildSnackBar(
                              false, 'Las nuevas contraseñas no coinciden.');
                        } else {
                          user =
                              user.copy(password: _newPasswordController2.text);
                          UserPreferences.setUser(user);
                          buildSnackBar(true, null);
                          Navigator.of(context).pop();
                        }
                      },
                      text: 'Guardar cambios'),
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

  ScaffoldMessengerState buildSnackBar(bool isValid, String? text) =>
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Row(children: [
              Icon(isValid ? Icons.check_circle_rounded : Icons.error_rounded,
                  color: Colors.white),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
              Expanded(
                  child: Text(
                      isValid ? 'Contraseña actualizada con éxito.' : text!,
                      style: const TextStyle(fontSize: 18.0)))
            ]),
            backgroundColor:
                isValid ? const Color(0xFF1ECF6C) : Colors.red.shade700,
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
                    child: const Text('No')),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Sí'))
              ]));
}
