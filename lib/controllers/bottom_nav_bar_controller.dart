import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/views/home.dart';
import 'package:meal_monkey/views/menu.dart';
import 'package:meal_monkey/views/more.dart';
import 'package:meal_monkey/views/offers.dart';
import 'package:meal_monkey/views/profile.dart';

class BottomNavBarController extends GetxController {
  RxInt _currentTabIndex = 0.obs;
  final List<Widget> _screens = [Home(), Menu(), Offers(), Profile(), More()];

  int get currentTabIndex => _currentTabIndex.value;

  void set currentTabIndex(int index) {
    _currentTabIndex = RxInt(index);
    update();
  }

  Widget get currentScreen => _screens[_currentTabIndex.value];
}
