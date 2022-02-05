import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/components/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:meal_monkey/controllers/bottom_nav_bar_controller.dart';

import '../app_data.dart';

class Common extends StatelessWidget {
  Common({Key? key}) : super(key: key);
  static const String id = '/common';
  final PageStorageBucket bucket = PageStorageBucket();
  final BottomNavBarController bnbc = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (bnbc) {
        return Scaffold(
          body: PageStorage(bucket: bucket, child: bnbc.currentScreen),
          bottomNavigationBar: BottomNavBar(),
          floatingActionButton: Container(
            width: 72,
            height: 72,
            child: FittedBox(
              child: FloatingActionButton(
                child: Icon(Icons.home, size: 30),
                backgroundColor: bnbc.currentTabIndex == 0 ? AppData.mainColor : AppData.placeholderColor,
                onPressed: () => bnbc.currentTabIndex = 0,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
