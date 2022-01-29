import 'package:flutter/material.dart';
import 'package:meal_monkey/components/bottom_nav_bar.dart';
import 'package:meal_monkey/providers/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';

class Common extends StatelessWidget {
  Common({Key? key}) : super(key: key);
  static const String id = '/common';

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavBarProvider>(
      create: (context) => BottomNavBarProvider(),
      builder: (context, child) {
        final bnbp = Provider.of<BottomNavBarProvider>(context);
        return Scaffold(
          body: PageStorage(
            bucket: bucket,
            child: bnbp.currentScreen,
          ),
          bottomNavigationBar: BottomNavBar(),
          floatingActionButton: Container(
            width: 72,
            height: 72,
            child: FittedBox(
              child: FloatingActionButton(
                child: Icon(Icons.home, size: 30),
                backgroundColor: bnbp.currentTabIndex == 0 ? AppData.mainColor : AppData.placeholderColor,
                onPressed: () => bnbp.currentTabIndex = 0,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
