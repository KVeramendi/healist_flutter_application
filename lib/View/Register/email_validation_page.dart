import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Form/input_form_page.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class EmailValidationPage extends StatefulWidget {
  const EmailValidationPage({Key? key}) : super(key: key);

  @override
  State<EmailValidationPage> createState() => _EmailValidationPageState();
}

class _EmailValidationPageState extends State<EmailValidationPage> {
  final String _userEmail = 'user_email@gmail.com';

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                  child: Column(children: <Widget>[
                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFF1ECF6C), width: 2.0))),
                    child: const Text('VALIDACIÓN DE CUENTA',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold))),
                const Padding(padding: EdgeInsets.symmetric(vertical: 35.0)),
                const SizedBox(
                    width: 300.0,
                    child: Text(
                        'Confirmaremos que esta dirección de correo electrónico le pertenece. Ingrese el código de 5 digitos incluido en el mensaje que enviamos a:',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 15.0, height: 1.5),
                        textAlign: TextAlign.center)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                Text(_userEmail,
                    style: const TextStyle(
                        color: Color(0xFF1ECF6C),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 40.0)),
                SizedBox(
                    width: 180.0,
                    child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Código',
                            hintStyle: TextStyle(letterSpacing: 0.0),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(letterSpacing: 20.0),
                        textAlign: TextAlign.center,
                        maxLength: 5)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                CustomElevateButtonWidget(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const InputFormPage())),
                    text: 'Confirmar'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                SizedBox(
                    width: 240.0,
                    child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(text: 'Al presionar en '),
                          TextSpan(
                              text: 'Confirmar',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ', acepta las '),
                          TextSpan(
                              text: 'Condiciones del Servicio',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' y la '),
                          TextSpan(
                              text: 'Política de Privacidad',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ], style: TextStyle(color: Colors.black87)),
                        textAlign: TextAlign.center))
              ])))));
}
