import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/controllers/bottom_nav_bar_controller.dart';

import '../../app_data.dart';

class NavBarItem extends StatelessWidget {
  NavBarItem({required this.icon, required this.label, required this.tabIndex});
  final IconData icon;
  final String label;
  final int tabIndex;
  final BottomNavBarController bnbc = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isSelected = bnbc.currentTabIndex == tabIndex;
    return MaterialButton(
      onPressed: () => bnbc.currentTabIndex = tabIndex,
      minWidth: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 21, color: isSelected ? AppData.mainColor : AppData.placeholderColor),
          SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 12, color: isSelected ? AppData.mainColor : AppData.placeholderColor)),
        ],
      ),
    );
  }
}
