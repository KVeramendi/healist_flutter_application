import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Menu/home_page.dart';
import 'package:healist_flutter_application/View/Register/register_page.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({Key? key}) : super(key: key);

  @override
  State<InputFormPage> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  UserModel _user = UserPreferences.getUser();
  final _formKey = GlobalKey<FormState>();
  String? _physicalActivity;
  String? _genre;

  @override
  Widget build(BuildContext context) => WillPopScope(
      child: SafeArea(
          child: Scaffold(
              body: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(children: <Widget>[
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFF1ECF6C), width: 2.0)),
                        ),
                        child: const Text('FORMULARIO',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold))),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0)),
                    Expanded(
                        child: Form(
                            key: _formKey,
                            child: Wrap(runSpacing: 15.0, children: [
                              TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Peso',
                                      helperText:
                                          'Ingrese su peso en kilogramos (kg)',
                                      helperStyle: TextStyle(
                                          fontStyle: FontStyle.italic),
                                      prefixIcon:
                                          Icon(Icons.monitor_weight_rounded),
                                      border: OutlineInputBorder()),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  onSaved: (newValue) => _user = _user.copy(
                                      weight: double.parse(newValue!)),
                                  validator: (value) => _errorWeight(value!)),
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0)),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Altura',
                                      helperText:
                                          'Ingrese su altura en centímetros (cm)',
                                      helperStyle: TextStyle(
                                          fontStyle: FontStyle.italic),
                                      prefixIcon: Icon(Icons.height_rounded),
                                      border: OutlineInputBorder()),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  onSaved: (newValue) => _user = _user.copy(
                                      height: double.parse(newValue!)),
                                  validator: (value) => _errorHeight(value!)),
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0)),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Edad',
                                      helperText: 'Ingrese su edad',
                                      helperStyle: TextStyle(
                                          fontStyle: FontStyle.italic),
                                      prefixIcon: Icon(Icons.person_rounded),
                                      border: OutlineInputBorder()),
                                  keyboardType: TextInputType.number,
                                  onSaved: (newValue) => _user =
                                      _user.copy(age: int.parse(newValue!)),
                                  validator: (value) => _errorAge(value!),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ]),
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0)),
                              DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem<String>(
                                        value: 'Muy ligera',
                                        child: Text('Muy ligera')),
                                    DropdownMenuItem<String>(
                                        value: 'Ligera', child: Text('Ligera')),
                                    DropdownMenuItem<String>(
                                        value: 'Regular',
                                        child: Text('Regular')),
                                    DropdownMenuItem<String>(
                                        value: 'Activa', child: Text('Activa')),
                                    DropdownMenuItem<String>(
                                        value: 'Muy activa',
                                        child: Text('Muy activa')),
                                  ].toList(),
                                  value: _physicalActivity,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                      labelText: 'Actividad física',
                                      helperText:
                                          'Ingrese su nivel de actividad física',
                                      helperStyle: TextStyle(
                                          fontStyle: FontStyle.italic),
                                      prefixIcon:
                                          Icon(Icons.directions_run_rounded),
                                      border: OutlineInputBorder()),
                                  onSaved: (newValue) => _user = _user.copy(
                                      physicalActivity: newValue as String),
                                  validator: (value) =>
                                      _errorPhysicalActivity(value)),
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0)),
                              DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem<String>(
                                        value: 'Femenino',
                                        child: Text('Femenino')),
                                    DropdownMenuItem<String>(
                                        value: 'Masculino',
                                        child: Text('Masculino')),
                                  ].toList(),
                                  value: _genre,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                      labelText: 'Género',
                                      helperText: 'Ingrese su género',
                                      helperStyle: TextStyle(
                                          fontStyle: FontStyle.italic),
                                      prefixIcon: Icon(Icons.group_rounded),
                                      border: OutlineInputBorder()),
                                  onSaved: (newValue) => _user =
                                      _user.copy(gender: newValue as String),
                                  validator: (value) => _errorGender(value))
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction)),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0)),
                    CustomElevateButtonWidget(
                        onPressed: () {
                          final _isValid = _formKey.currentState!.validate();
                          if (_isValid) {
                            _formKey.currentState!.save();
                            _user = _user.copy(
                                water: _user.recommendedWater,
                                kilocalories: _user.recommendedKilocalories,
                                fruitsVegetables:
                                    _user.recommendedFruitsVegetables,
                                proteins: _user.recommendedProteins,
                                carbohydrates: _user.recommendedCarbohydrates,
                                fats: _user.recommendedFats,
                                closedSession: false);
                            UserPreferences.setUser(_user);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          }
                        },
                        text: 'Aceptar')
                  ])),
              resizeToAvoidBottomInset: false)),
      onWillPop: () async => await showWarning(context) ?? false);

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
              title: const Text('¿Desea cancelar el proceso de registro?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    autofocus: true,
                    child: const Text('No', style: TextStyle(fontSize: 18.0))),
                TextButton(
                    onPressed: () {
                      _user = _user.copy(
                        fullName: '',
                        email: 'test@test.dev',
                        password: 'test.dev',
                      );
                      UserPreferences.setUser(_user);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                    },
                    child: const Text('Sí', style: TextStyle(fontSize: 18.0)))
              ]));

  String? _errorWeight(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar su peso';
    }
    final _value = double.parse(text);
    if (_value < 1) {
      return 'El peso debe ser mayor a cero';
    }
    if (_value > 200) {
      return 'El valor ingresado no es válido';
    }
    return null;
  }

  String? _errorHeight(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar su altura';
    }
    final _value = double.parse(text);
    if (_value < 1) {
      return 'La altura debe ser mayor a cero';
    }
    if (_value > 300) {
      return 'El valor ingresado no es válido';
    }
    return null;
  }

  String? _errorAge(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar su edad';
    }
    final _value = int.parse(text);
    if (_value < 18) {
      return 'El usuario debe ser mayor de edad';
    }
    if (_value > 200) {
      return 'El valor ingresado no es válido';
    }
    return null;
  }

  String? _errorPhysicalActivity(Object? text) =>
      text == null ? 'Debe ingresar su nivel de activifdad física' : null;

  String? _errorGender(Object? text) =>
      text == null ? 'Debe ingresar su género' : null;
}
