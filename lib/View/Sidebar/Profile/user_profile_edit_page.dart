import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/Widget/user_profile_dropdownbutton_widget.dart';
import 'package:healist_flutter_application/Widget/user_profile_textfield_widget.dart';

class UserProfileEditPage extends StatefulWidget {
  const UserProfileEditPage({Key? key}) : super(key: key);

  @override
  State<UserProfileEditPage> createState() => _UserProfileEditPageState();
}

class _UserProfileEditPageState extends State<UserProfileEditPage> {
  late User user;
  late User userInitialState;
  final _physicalActivityItems = [
    'Muy ligera',
    'Ligera',
    'Regular',
    'Activa',
    'Muy Activa'
  ];
  final _genderItems = ['Femenino', 'Masculino'];

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
    userInitialState = user;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Scaffold(
            appBar: buildAppBar(),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  UserProfileTextFieldWidget(
                      label: 'Peso',
                      text: '${user.weight}',
                      onChanged: (value) => user =
                          user.copy(weight: num.tryParse(value)?.toDouble()),
                      isNumerical: true,
                      isEditable: true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  UserProfileTextFieldWidget(
                      label: 'Altura',
                      text: '${user.height}',
                      onChanged: (value) => user =
                          user.copy(height: num.tryParse(value)?.toDouble()),
                      isNumerical: true,
                      isEditable: true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  UserProfileTextFieldWidget(
                      label: 'Edad',
                      text: '${user.age}',
                      onChanged: (value) =>
                          user = user.copy(age: num.tryParse(value)?.toInt()),
                      isNumerical: true,
                      isEditable: true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  UserProfileDropDownButtonWidget(
                      label: 'Nivel de actividad física',
                      items: _physicalActivityItems,
                      value: user.physicalActivity,
                      onChanged: (value) {
                        setState(() {});
                        user = user.copy(physicalActivity: value);
                      }),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  UserProfileDropDownButtonWidget(
                      label: 'Género',
                      items: _genderItems,
                      value: user.gender,
                      onChanged: (value) {
                        setState(() {});
                        user = user.copy(gender: value);
                      }),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                  ElevatedButton(
                      onPressed: () {
                        UserPreferences.setUser(user);
                        Navigator.of(context).pop();
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
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Mali')))
                ]))),
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

  AppBar buildAppBar() => AppBar(
      leading: const BackButton(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.transparent);

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
