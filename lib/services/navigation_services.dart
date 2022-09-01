import 'package:flutter/cupertino.dart';

class NavigationServicesProvider extends ChangeNotifier{
  int _pageNumber = 0;

  int get pageNumber => _pageNumber;

  void changeNumber({required int numberData}){
    _pageNumber = numberData;
    notifyListeners();
  }
}