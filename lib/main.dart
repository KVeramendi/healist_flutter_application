import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healist',
      theme: ThemeData(fontFamily: 'Mali'),
      home: const LoginPage(),
    );
  }
}
