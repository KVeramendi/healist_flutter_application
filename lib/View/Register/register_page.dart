import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Register/email_validation_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String _tittlePage = 'CREAR CUENTA';
  final String _registerButton = 'Registrarse';
  final String _textDescription = '¿Ya tienes una cuenta?';
  final String _loginButton = 'Ingresa aquí';

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
                              color: Colors.greenAccent.shade700, width: 2.0)),
                    ),
                    child: Text(_tittlePage,
                        style: const TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold))),
                const Padding(padding: EdgeInsets.symmetric(vertical: 40.0)),
                TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: 'Nombre Completo',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person))),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    )),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar contraseña',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 35.0)),
                Container(
                  clipBehavior: Clip.antiAlias,
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
                            builder: (context) => const EmailValidationPage(),
                          ));
                    },
                    color: Colors.greenAccent.shade700,
                    child: Text(
                      _registerButton,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12.5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _textDescription,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: Text(_loginButton,
                          style: TextStyle(color: Colors.greenAccent.shade700)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
