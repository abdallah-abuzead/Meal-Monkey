import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/providers/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      shape: CircularNotchedRectangle(),
      notchMargin: 20,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 90,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NavBarItem(icon: Icons.dashboard, label: 'Menu', tabIndex: 1),
                      NavBarItem(icon: Icons.shopping_basket, label: 'Offers', tabIndex: 2),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NavBarItem(icon: Icons.person, label: 'Profile', tabIndex: 3),
                      NavBarItem(icon: Icons.read_more, label: 'More', tabIndex: 4),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: AppData.primaryFontColor, thickness: 5, indent: 140, endIndent: 140),
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  NavBarItem({required this.icon, required this.label, required this.tabIndex});
  final IconData icon;
  final String label;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    final bnbp = Provider.of<BottomNavBarProvider>(context);
    bool isSelected = bnbp.currentTabIndex == tabIndex;

    return MaterialButton(
      onPressed: () => bnbp.currentTabIndex = tabIndex,
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
