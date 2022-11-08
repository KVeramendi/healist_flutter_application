import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Register/email_validation_page.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserModel _user = UserPreferences.getUser();
  final _formKey = GlobalKey<FormState>();
  late final EmailAuth _emailAuthentication;
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  void initState() {
    super.initState();
    _emailAuthentication = EmailAuth(sessionName: 'Healist');
  }

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(25.0),
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
                const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                Expanded(
                    child: Form(
                        key: _formKey,
                        child: Wrap(runSpacing: 15.0, children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Nombre Completo',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.name,
                            onSaved: (newValue) =>
                                _user = _user.copy(fullName: newValue),
                            validator: (value) => _errorFullName(value!),
                          ),
                          TextFormField(
                            controller: _userEmailController,
                            decoration: const InputDecoration(
                                labelText: 'Correo electrónico',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (newValue) =>
                                _user = _user.copy(email: newValue),
                            validator: (value) => _errorEmail(value!),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: 'Contraseña',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () => setState(
                                        () => _obscureText1 = !_obscureText1),
                                    icon: _obscureText1
                                        ? const Icon(
                                            Icons.visibility_off_rounded)
                                        : const Icon(Icons.visibility_rounded)),
                                border: const OutlineInputBorder()),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscureText1,
                            validator: (value) => _errorPassword(value!),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Confirmar contraseña',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () => setState(
                                        () => _obscureText2 = !_obscureText2),
                                    icon: _obscureText2
                                        ? const Icon(
                                            Icons.visibility_off_rounded)
                                        : const Icon(Icons.visibility_rounded)),
                                border: const OutlineInputBorder()),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscureText2,
                            onSaved: (newValue) =>
                                _user = _user.copy(password: newValue),
                            validator: (value) => _errorConfirmPassword(value!),
                          )
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 35.0)),
                CustomElevateButtonWidget(
                    onPressed: () {
                      final _isValid = _formKey.currentState!.validate();
                      if (_isValid) {
                        _formKey.currentState!.save();
                        UserPreferences.setUser(_user);
                        sendOTP();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EmailValidationPage(
                                  email: _userEmailController.text,
                                  emailAuth: _emailAuthentication,
                                )));
                      }
                    },
                    text: 'Registrarse'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
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
              ])),
          resizeToAvoidBottomInset: false));

  void sendOTP() async => await _emailAuthentication.sendOtp(
      recipientMail: _userEmailController.text);

  String? _errorFullName(String text) {
    if (text.isEmpty) {
      return 'Ingrese un nombre';
    }
    if (text.length > 27) {
      return 'El nombre no puede exceder los 27 caracteres';
    }
    return null;
  }

  String? _errorEmail(String text) {
    const _pattern =
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$";
    if (text.isEmpty) {
      return 'Ingrese un correo electrónico';
    }
    if (!RegExp(_pattern).hasMatch(text)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  String? _errorPassword(String text) {
    if (text.isEmpty) {
      return 'Ingrese una contraseña';
    }
    if (text.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (!text.contains(RegExp(r'[A-Z]'))) {
      return 'La contraseña debe tener al menos 1 mayúscula';
    }
    if (!text.contains(RegExp(r'[a-z]'))) {
      return 'La contraseña debe tener al menos 1 minúscula';
    }
    if (!text.contains(RegExp(r'[0-9]'))) {
      return 'La contraseña debe tener al menos 1 dígito';
    }
    if (!text.contains(RegExp(r'[#?!@/$%^&*-]'))) {
      return 'La contraseña debe tener algún carácter especial';
    }
    return null;
  }

  String? _errorConfirmPassword(String text) {
    final _otherPassword = _passwordController.text;
    if (text.isEmpty) {
      return 'Ingrese una contraseña';
    }
    if (text.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (!text.contains(RegExp(r'[A-Z]'))) {
      return 'La contraseña debe tener al menos 1 mayúscula';
    }
    if (!text.contains(RegExp(r'[a-z]'))) {
      return 'La contraseña debe tener al menos 1 minúscula';
    }
    if (!text.contains(RegExp(r'[0-9]'))) {
      return 'La contraseña debe tener al menos 1 dígito';
    }
    if (!text.contains(RegExp(r'[#?!@/$%^&*-]'))) {
      return 'La contraseña debe tener algún carácter especial';
    }
    if (_otherPassword != '' && text.isNotEmpty && text != _otherPassword) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }
}
