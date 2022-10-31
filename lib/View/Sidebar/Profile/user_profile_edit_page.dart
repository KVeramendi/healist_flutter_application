import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/Widget/custom_appbar_widget.dart';
import 'package:healist_flutter_application/Widget/custom_dropdownbutton_widget.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';
import 'package:healist_flutter_application/Widget/custom_textfield_widget.dart';

class UserProfileEditPage extends StatefulWidget {
  const UserProfileEditPage({Key? key}) : super(key: key);

  @override
  State<UserProfileEditPage> createState() => _UserProfileEditPageState();
}

class _UserProfileEditPageState extends State<UserProfileEditPage> {
  late UserModel user, userInitialState;
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
          appBar: const CustomAppBarWidget(),
          body: ListView(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              children: [
                CustomTextFieldWidget(
                    label: 'Peso',
                    text: '${user.weight}',
                    onChanged: (value) => user =
                        user.copy(weight: num.tryParse(value)?.toDouble()),
                    keyboardType: TextInputType.number),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                CustomTextFieldWidget(
                    label: 'Altura',
                    text: '${user.height}',
                    onChanged: (value) => user =
                        user.copy(height: num.tryParse(value)?.toDouble()),
                    keyboardType: TextInputType.number),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                CustomTextFieldWidget(
                    label: 'Edad',
                    text: '${user.age}',
                    onChanged: (value) =>
                        user = user.copy(age: num.tryParse(value)?.toInt()),
                    keyboardType: TextInputType.number),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                CustomDropDownButtonWidget(
                    label: 'Nivel de actividad física',
                    items: _physicalActivityItems,
                    value: user.physicalActivity,
                    onChanged: (value) {
                      setState(() {});
                      user = user.copy(physicalActivity: value);
                    }),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                CustomDropDownButtonWidget(
                    label: 'Género',
                    items: _genderItems,
                    value: user.gender,
                    onChanged: (value) {
                      setState(() {});
                      user = user.copy(gender: value);
                    }),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                CustomElevateButtonWidget(
                    height: 50,
                    onPressed: () {
                      user = user.copy(
                          water: user.recommendedWater,
                          kilocalories: user.recommendedKilocalories,
                          fruitsVegetables: user.recommendedFruitsVegetables,
                          proteins: user.recommendedProteins,
                          carbohydrates: user.recommendedCarbohydrates,
                          fats: user.recommendedFats);
                      UserPreferences.setUser(user);
                      buildSnackBar();
                      Navigator.of(context).pop();
                    },
                    text: 'Guardar cambios')
              ])),
      onWillPop: () async {
        final isEditedPage = user.hashCode != userInitialState.hashCode;
        if (isEditedPage) {
          final shoulPop = await showWarning(context);
          return shoulPop ?? false;
        } else {
          return true;
        }
      });

  ScaffoldMessengerState buildSnackBar() => ScaffoldMessenger.of(context)
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
