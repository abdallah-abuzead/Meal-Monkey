import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';

import '../constants.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Menu'),
            // =======================================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(decoration: kSearchFoodDecoration),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 50),
                child: Stack(
                  children: [
                    Container(width: Get.width, height: Get.height),
                    Positioned(
                      child: Container(
                        width: 97,
                        decoration: BoxDecoration(
                          color: AppData.mainColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
