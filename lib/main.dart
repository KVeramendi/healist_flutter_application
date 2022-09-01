import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Login/login_page.dart';
import 'package:healist_flutter_application/View/Menu/home_page.dart';
import 'package:healist_flutter_application/services/navigation_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false,create: (_) => NavigationServicesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Healist',
        theme: ThemeData(
          // primarySwatch: Colors.lightGreen,
        ),
        home: const HomePage(),
      ),
    );
  }
}
