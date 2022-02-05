import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/models/custom_user.dart';
import 'package:meal_monkey/views/welcome.dart';

import '../app_data.dart';

Widget CustomAppBar({required String title, bool back = false, bool greeting = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 23),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            back ? Icon(Icons.arrow_back_ios) : Container(),
            Text(
              title,
              style: TextStyle(
                color: AppData.primaryFontColor,
                fontSize: greeting ? 20 : 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        InkWell(
          child: Icon(Icons.shopping_cart, color: AppData.primaryFontColor, size: 23),
          onTap: () async {
            await CustomUser.signOut();
            Get.offAllNamed(Welcome.id);
          },
        ),
      ],
    ),
  );
}

// ==============================================================================

Widget CustomHeader({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 23),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: AppData.primaryFontColor, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Text('View all', style: TextStyle(fontSize: 13, color: AppData.mainColor)),
      ],
    ),
  );
}

// ===========================================================================

Column logoText() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Meal ',
            style: TextStyle(color: AppData.mainColor, fontSize: 34, fontWeight: FontWeight.bold),
          ),
          Text(
            'Monkey',
            style: TextStyle(color: AppData.primaryFontColor, fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(height: 5),
      Text(
        'FOOD DELIVERY',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppData.primaryFontColor, fontSize: 10, letterSpacing: 2.5, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

// ============================================================================

Text smallText(String text, {double fontSize = 14}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: AppData.secondaryFontColor, fontWeight: FontWeight.w500, fontSize: fontSize),
  );
}

// ============================================================================

Text titleText(String text, {double fontSize = 30}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: AppData.primaryFontColor, fontSize: fontSize, fontWeight: FontWeight.bold),
  );
}

// ============================================================================

Container buildStarContainer() {
  return Container(
    width: 56,
    height: 56,
    padding: EdgeInsets.only(top: 10),
    child: Center(child: Text('*', style: TextStyle(fontSize: 37, color: Color(0XFFB6B7B7)))),
    decoration: BoxDecoration(color: Color(0XFFF2F2F2), borderRadius: BorderRadius.circular(15)),
  );
}
