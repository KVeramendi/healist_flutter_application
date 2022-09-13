import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Menu/Foods/food_category_page.dart';
import 'package:healist_flutter_application/View/Menu/Progress/daily_progress_page.dart';
import 'package:healist_flutter_application/View/Menu/Reminders/reminders_page.dart';
import 'package:healist_flutter_application/View/Menu/Reports/reports_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _itemsNavigationBar = const [
    Icon(Icons.dining_outlined, size: 30.0, color: Colors.white),
    Icon(Icons.pie_chart_outlined, size: 30.0, color: Colors.white),
    Icon(Icons.dashboard_outlined, size: 30.0, color: Colors.white),
    Icon(Icons.notifications_outlined, size: 30.0, color: Colors.white),
    Icon(Icons.rss_feed_outlined, size: 30.0, color: Colors.white)
  ];
  final List<String> _titlePage = [
    'LISTA DE ALIMENTOS',
    'SEGUIMIENTO NUTRICIONAL',
    'PROGRESO DIARIO',
    'RECORDATORIOS',
    'PORTAL BIOTRENDIES'
  ];
  int indexPage = 2;
  final List<Widget> _pages = const [
    FoodCategoryPage(),
    ReportsPage(),
    DailyProgressPage(),
    RemindersPage(),
    Center(child: Text('Portal Biotrendies')),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.greenAccent.shade700,
            title: Text(
              _titlePage[indexPage],
            ),
          ),
          body: _pages[indexPage],
          bottomNavigationBar: CurvedNavigationBar(
            items: _itemsNavigationBar,
            index: indexPage,
            color: Colors.greenAccent.shade700,
            buttonBackgroundColor: Colors.greenAccent.shade700,
            backgroundColor: Colors.transparent,
            onTap: (indexPage) => setState(() => this.indexPage = indexPage),
            animationCurve: Curves.linearToEaseOut,
            animationDuration: const Duration(milliseconds: 325),
            height: 60.0,
          )),
    );
  }
}
