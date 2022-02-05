import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';

import 'nav_bar_item.dart';

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
