import 'package:flutter/material.dart';

class EmailValidationPage extends StatefulWidget {
  const EmailValidationPage({Key? key}) : super(key: key);

  @override
  State<EmailValidationPage> createState() => _EmailValidationPageState();
}

class _EmailValidationPageState extends State<EmailValidationPage> {
  final String _tittlePage = 'VERIFICACIÓN DE CUENTA';
  final String _textDescription =
      'Confirmaremos que esta dirección de correo electrónico le pertenece. Ingrese el código de 5 digitos incluido en el mensaje que enviamos a:';
  final String _userEmail = 'user_email@gmail.com';
  final String _confirmButton = 'Confirmar';

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
                  const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
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
                  const Padding(padding: EdgeInsets.symmetric(vertical: 35.0)),
                  SizedBox(
                      width: 270.0,
                      child: Text(_textDescription,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 15.0,
                              height: 1.5),
                          textAlign: TextAlign.center)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  Text(_userEmail,
                      style: TextStyle(
                        color: Colors.greenAccent.shade700,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 40.0)),
                  SizedBox(
                    width: 180.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Código',
                        hintStyle: TextStyle(letterSpacing: 0.0),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(letterSpacing: 20.0),
                      textAlign: TextAlign.center,
                      maxLength: 5,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const EmailValidationPage(),
                        //     ));
                      },
                      color: Colors.greenAccent.shade700,
                      child: Text(
                        _confirmButton,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  SizedBox(
                      width: 240.0,
                      child: RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 14.0),
                              children: [
                                TextSpan(text: 'Al presionar en '),
                                TextSpan(
                                    text: 'Confirmar',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ', acepta las '),
                                TextSpan(
                                    text: 'Condiciones del Servicio',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' y la '),
                                TextSpan(
                                    text: 'Política de Privacidad',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                          textAlign: TextAlign.center))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
