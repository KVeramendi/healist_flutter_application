import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Menu/home_page.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({Key? key}) : super(key: key);

  @override
  State<InputFormPage> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  final String _tittlePage = 'FORMULARIO DE ENTRADA';
  final String _acceptButton = 'Aceptar';
  String? _physicalActivity;
  String? _genre;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.greenAccent.shade700,
                                width: 2.0)),
                      ),
                      child: Text(_tittlePage,
                          style: const TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold))),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          helperText: 'Ingrese su peso en kilogramos (kg)',
                          labelText: 'Peso',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.monitor_weight_rounded))),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                          helperText: 'Ingrese su altura en centímetros (cm)',
                          labelText: 'Altura',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.height_rounded))),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          helperText: 'Ingrese su edad',
                          labelText: 'Edad',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person))),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem<String>(
                        child: Text('Muy ligera'),
                        value: '1',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Ligera'),
                        value: '2',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Regular'),
                        value: '3',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Activa'),
                        value: '4',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Muy activa'),
                        value: '5',
                      ),
                    ].toList(),
                    value: _physicalActivity,
                    onChanged: (String? value) {
                      setState(() {
                        _physicalActivity = value;
                      });
                    },
                    decoration: const InputDecoration(
                      helperText: 'Ingrese su nivel de actividad física',
                      labelText: 'Actividad física',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.directions_run_rounded),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem<String>(
                        child: Text('Femenino'),
                        value: 'F',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Masculino'),
                        value: 'M',
                      ),
                    ].toList(),
                    value: _genre,
                    onChanged: (String? value) {
                      setState(() {
                        _genre = value;
                      });
                    },
                    decoration: const InputDecoration(
                      helperText: 'Ingrese su género',
                      labelText: 'Género',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.group_rounded),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      color: Colors.greenAccent.shade700,
                      child: Text(
                        _acceptButton,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
