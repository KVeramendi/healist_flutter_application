import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Menu/home_page.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({Key? key}) : super(key: key);

  @override
  State<InputFormPage> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  String? _physicalActivity;
  String? _genre;

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                  child: Column(children: <Widget>[
                const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFF1ECF6C), width: 2.0)),
                    ),
                    child: const Text('FORMULARIO',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold))),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Peso',
                        helperText: 'Ingrese su peso en kilogramos (kg)',
                        helperStyle: TextStyle(fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.monitor_weight_rounded),
                        border: OutlineInputBorder()),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Altura',
                        helperText: 'Ingrese su altura en centímetros (cm)',
                        helperStyle: TextStyle(fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.height_rounded),
                        border: OutlineInputBorder()),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Edad',
                        helperText: 'Ingrese su edad',
                        helperStyle: TextStyle(fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.person_rounded),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem<String>(
                          value: 'Muy ligera', child: Text('Muy ligera')),
                      DropdownMenuItem<String>(
                          value: 'Ligera', child: Text('Ligera')),
                      DropdownMenuItem<String>(
                          value: 'Regular', child: Text('Regular')),
                      DropdownMenuItem<String>(
                          value: 'Activa', child: Text('Activa')),
                      DropdownMenuItem<String>(
                          value: 'Muy activa', child: Text('Muy activa')),
                    ].toList(),
                    value: _physicalActivity,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                        labelText: 'Actividad física',
                        helperText: 'Ingrese su nivel de actividad física',
                        helperStyle: TextStyle(fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.directions_run_rounded),
                        border: OutlineInputBorder())),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem<String>(
                          value: 'Femenino', child: Text('Femenino')),
                      DropdownMenuItem<String>(
                          value: 'Masculino', child: Text('Masculino')),
                    ].toList(),
                    value: _genre,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                        labelText: 'Género',
                        helperText: 'Ingrese su género',
                        helperStyle: TextStyle(fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.group_rounded),
                        border: OutlineInputBorder())),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                CustomElevateButtonWidget(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const HomePage())),
                    text: 'Aceptar')
              ])))));
}
