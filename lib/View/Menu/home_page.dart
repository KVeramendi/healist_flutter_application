import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/services/navigation_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final navigatorServiceProvide = Provider.of<NavigationServicesProvider>(context);

    final List<Widget> _itemsNavigationBar = [
      Icon(Icons.dining_outlined, size: 30.0, color: (navigatorServiceProvide.pageNumber == 0) ? Colors.red : Colors.white),
      Icon(Icons.pie_chart_outlined, size: 30.0, color: (navigatorServiceProvide.pageNumber == 1) ? Colors.red : Colors.white),
      Icon(Icons.dashboard_outlined, size: 30.0, color: (navigatorServiceProvide.pageNumber == 2) ? Colors.red : Colors.white),
      Icon(Icons.notifications_outlined, size: 30.0, color: (navigatorServiceProvide.pageNumber == 3) ? Colors.red : Colors.white),
      Icon(Icons.rss_feed_outlined, size: 30.0, color: (navigatorServiceProvide.pageNumber == 4) ? Colors.red : Colors.white)
    ];
    final List<String> _titlePage = [
      'LISTA DE ALIMENTOS',
      'SEGUIMIENTO NUTRICIONAL',
      'PROGRESO DIARIO',
      'RECORDATORIOS',
      'PORTAL BIOTRENDIES'
    ];
    int indexPage = 2;
    final List<Widget> _pages =[
      Center(child: Text('Lista de comida')),
      Center(child: Text('Seguimiento nutricional')),
      Center(child: Text('Progreso diario')),
      Center(child: Text('Recordatorios')),
      Center(child: Text('Portal Biotrendies')),
    ];



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
            onTap: (indexPage) => {
              navigatorServiceProvide.changeNumber(numberData: indexPage)
            },
            animationCurve: Curves.linearToEaseOut,
            animationDuration: const Duration(milliseconds: 325),
            height: 60.0,
          )),
    );
  }
}
