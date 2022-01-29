import 'package:flutter/material.dart';
import 'package:meal_monkey/screens/home.dart';
import 'package:meal_monkey/screens/menu.dart';
import 'package:meal_monkey/screens/more.dart';
import 'package:meal_monkey/screens/offers.dart';
import 'package:meal_monkey/screens/profile.dart';

class BottomNavBarProvider extends ChangeNotifier{
  int _currentTabIndex = 0;
  final List<Widget> _screens = [Home(), Menu(), Offers(), Profile(), More()];

  int get currentTabIndex => _currentTabIndex;

  void set currentTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  Widget get currentScreen => _screens[_currentTabIndex];

}