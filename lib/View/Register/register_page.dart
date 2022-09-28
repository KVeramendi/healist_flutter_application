import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Register/email_validation_page.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;

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
                    child: const Text('CREAR CUENTA',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold))),
                const Padding(padding: EdgeInsets.symmetric(vertical: 40.0)),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Nombre Completo',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.name),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                    controller: _passwordController1,
                    decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() => _obscureText1 = !_obscureText1),
                            icon: _obscureText1
                                ? const Icon(Icons.visibility_off_rounded)
                                : const Icon(Icons.visibility_rounded)),
                        border: const OutlineInputBorder()),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText1),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                TextFormField(
                    controller: _passwordController2,
                    decoration: InputDecoration(
                        labelText: 'Confirmar contraseña',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() => _obscureText2 = !_obscureText2),
                            icon: _obscureText2
                                ? const Icon(Icons.visibility_off_rounded)
                                : const Icon(Icons.visibility_rounded)),
                        border: const OutlineInputBorder()),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText2),
                const Padding(padding: EdgeInsets.symmetric(vertical: 35.0)),
                CustomElevateButtonWidget(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const EmailValidationPage())),
                    text: 'Registrarse'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12.5)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('¿Ya tienes una cuenta?',
                      style: TextStyle(color: Colors.black54, fontSize: 16.0)),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage())),
                      child: const Text('Ingresa aquí',
                          style: TextStyle(
                              color: Color(0xFF1ECF6C), fontSize: 16.0)))
                ])
              ])))));
}
