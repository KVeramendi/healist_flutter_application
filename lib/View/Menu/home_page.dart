import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Menu/Foods/food_category_page.dart';
import 'package:healist_flutter_application/View/Menu/Progress/daily_progress_page.dart';
import 'package:healist_flutter_application/View/Menu/RSS/rss_feed_page.dart';
import 'package:healist_flutter_application/View/Menu/Reminders/reminders_page.dart';
import 'package:healist_flutter_application/View/Menu/Reports/reports_page.dart';
import 'package:healist_flutter_application/Widget/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _titlePage = [
    'LISTA DE ALIMENTOS',
    'SEGUIMIENTO NUTRICIONAL',
    'PROGRESO DIARIO',
    'RECORDATORIOS',
    'PORTAL BIOTRENDIES'
  ];
  int _pageIndex = 2;
  final List<Widget> _pages = const [
    FoodCategoryPage(),
    ReportsPage(),
    DailyProgressPage(),
    RemindersPage(),
    RSSFeedPage()
  ];
  late List<bool> _isItemSelected;

  @override
  void initState() {
    super.initState();
    _isItemSelected = [false, false, true, false, false];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _navigationBarItems = [
      Icon(_isItemSelected[0] ? Icons.dining_rounded : Icons.dining_outlined,
          size: _isItemSelected[0] ? 36.0 : 28.0,
          color:
              _isItemSelected[0] ? Colors.greenAccent.shade700 : Colors.white),
      Icon(
          _isItemSelected[1]
              ? Icons.pie_chart_rounded
              : Icons.pie_chart_outlined,
          size: _isItemSelected[1] ? 36.0 : 28.0,
          color:
              _isItemSelected[1] ? Colors.greenAccent.shade700 : Colors.white),
      Icon(
          _isItemSelected[2]
              ? Icons.dashboard_rounded
              : Icons.dashboard_outlined,
          size: _isItemSelected[2] ? 36.0 : 28.0,
          color:
              _isItemSelected[2] ? Colors.greenAccent.shade700 : Colors.white),
      Icon(
          _isItemSelected[3]
              ? Icons.notifications_rounded
              : Icons.notifications_outlined,
          size: _isItemSelected[3] ? 36.0 : 28.0,
          color:
              _isItemSelected[3] ? Colors.greenAccent.shade700 : Colors.white),
      Icon(
          _isItemSelected[4] ? Icons.rss_feed_rounded : Icons.rss_feed_outlined,
          size: _isItemSelected[4] ? 36.0 : 28.0,
          color:
              _isItemSelected[4] ? Colors.greenAccent.shade700 : Colors.white)
    ];
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Text(_titlePage[_pageIndex]),
                backgroundColor: Colors.greenAccent.shade700,
                centerTitle: true),
            body: _pages[_pageIndex],
            drawer: const NavigationDrawerWidget(),
            bottomNavigationBar: CurvedNavigationBar(
                items: _navigationBarItems,
                index: _pageIndex,
                color: Colors.greenAccent.shade700,
                buttonBackgroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                onTap: (index) {
                  for (int i = 0; i < _navigationBarItems.length; i++) {
                    i == index
                        ? _isItemSelected[i] = true
                        : _isItemSelected[i] = false;
                  }
                  setState(() => _pageIndex = index);
                },
                animationCurve: Curves.linearToEaseOut,
                animationDuration: const Duration(milliseconds: 325),
                height: 56.0)));
  }
}
