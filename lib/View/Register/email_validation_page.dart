import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healist_flutter_application/Model/user_model.dart';
import 'package:healist_flutter_application/Util/user_preferences.dart';
import 'package:healist_flutter_application/View/Form/input_form_page.dart';
import 'package:healist_flutter_application/View/Register/register_page.dart';
import 'package:healist_flutter_application/Widget/custom_elevatebutton_widget.dart';

class EmailValidationPage extends StatefulWidget {
  final String email;
  final EmailAuth emailAuth;
  const EmailValidationPage(
      {Key? key, required this.email, required this.emailAuth})
      : super(key: key);

  @override
  State<EmailValidationPage> createState() => _EmailValidationPageState();
}

class _EmailValidationPageState extends State<EmailValidationPage> {
  UserModel _user = UserPreferences.getUser();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userOTPCode = TextEditingController();

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                        child: Column(children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25.0)),
                      Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF1ECF6C), width: 2.0))),
                          child: const Text('VALIDACIÓN DE CUENTA',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.0)),
                      const SizedBox(
                          width: 300.0,
                          child: Text(
                              'Confirmaremos que esta dirección de correo electrónico le pertenece. Ingrese el código de 6 digitos incluido en el mensaje que enviamos a:',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15.0,
                                  height: 1.5),
                              textAlign: TextAlign.center)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0)),
                      Text(widget.email,
                          style: const TextStyle(
                              color: Color(0xFF1ECF6C),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.0)),
                      SizedBox(
                          width: 260.0,
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                                controller: _userOTPCode,
                                decoration: const InputDecoration(
                                    hintText: 'Ingrese el código',
                                    hintStyle: TextStyle(letterSpacing: 0.0),
                                    border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                                style: const TextStyle(letterSpacing: 30.0),
                                textAlign: TextAlign.center,
                                maxLength: 6,
                                validator: (value) => _errorOTP(value!),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                          )),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0)),
                      CustomElevateButtonWidget(
                          onPressed: () {
                            final _isValid = _formKey.currentState!.validate();
                            if (_isValid) {
                              buildSnackBar();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const InputFormPage()));
                            }
                          },
                          text: 'Confirmar'),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0)),
                      SizedBox(
                          width: 240.0,
                          child: RichText(
                              text: const TextSpan(children: [
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
                                        TextStyle(fontWeight: FontWeight.bold))
                              ], style: TextStyle(color: Colors.black87)),
                              textAlign: TextAlign.center))
                    ]))))),
        onWillPop: () async => await showWarning(context) ?? false,
      );

  bool validateOTP() => widget.emailAuth
      .validateOtp(recipientMail: widget.email, userOtp: _userOTPCode.text);

  ScaffoldMessengerState buildSnackBar() => ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Row(children: const [
          Icon(Icons.check_circle_rounded, color: Colors.white),
          Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
          Expanded(
              child: Text('Correo electrónico verificado',
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

  String? _errorOTP(String text) {
    if (text.isEmpty) {
      return 'Ingrese el código enviado a su correo';
    }
    final _result = validateOTP();
    if (!_result) {
      return 'El código ingresado es incorrecto';
    }
    return null;
  }
}
