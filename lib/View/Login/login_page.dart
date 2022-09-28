import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Menu/home_page.dart';
import 'package:healist_flutter_application/View/Register/register_page.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user = UserPreferences.getUser();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static const _pattern =
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$";
  bool _obscureText = true;
  bool _emailValidation = true;
  bool _passwordValidation = true;

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                Image.asset('assets/images/healist_logo.png', width: 230.0),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                Expanded(
                    child: Form(
                        key: _formKey,
                        child: Wrap(runSpacing: 15.0, children: [
                          TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  labelText: 'Correo electrónico',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) =>
                                  setState(() => _emailValidation = false),
                              validator: (value) {
                                final _isValid =
                                    RegExp(_pattern).hasMatch(value!);
                                if (!_emailValidation) {
                                  _emailValidation = true;
                                  if (value.isEmpty) {
                                    return 'Ingrese su contraseña';
                                  }
                                  if (value != user.email) {
                                    return 'Correo electrónico incorrecto';
                                  }
                                }
                                if (!_isValid) {
                                  return 'Ingrese un correo válido';
                                }
                              }),
                          TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      onPressed: () => setState(
                                          () => _obscureText = !_obscureText),
                                      icon: _obscureText
                                          ? const Icon(
                                              Icons.visibility_off_rounded)
                                          : const Icon(
                                              Icons.visibility_rounded)),
                                  border: const OutlineInputBorder()),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscureText,
                              onSaved: (value) =>
                                  setState(() => _passwordValidation = false),
                              validator: (value) {
                                if (!_passwordValidation) {
                                  _passwordValidation = true;
                                  if (value!.isEmpty) {
                                    return 'Ingrese su contraseña';
                                  }
                                  if (value != user.password) {
                                    return 'Contraseña incorrecta';
                                  }
                                }
                              })
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction)),
                CustomElevateButtonWidget(
                    onPressed: () {
                      // final _isValid = _formKey.currentState!.validate();
                      // final _isEmailValid = user.email == _emailController.text;
                      // final _isPasswordValid =
                      //     user.password == _passwordController.text;
                      // if (_isValid && _isEmailValid && _isPasswordValid) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                      // }
                      // if (!_isEmailValid || !_isPasswordValid) {
                      //   _formKey.currentState!.save();
                      // }
                    },
                    text: 'Iniciar sesión'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('¿Aún no tienes una cuenta?',
                      style: TextStyle(color: Colors.black54, fontSize: 16.0)),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage())),
                      child: const Text('Registrarse',
                          style: TextStyle(
                              color: Color(0xFF1ECF6C), fontSize: 16.0)))
                ])
              ]))));
}
