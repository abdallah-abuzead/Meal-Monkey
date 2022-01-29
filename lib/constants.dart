import 'package:flutter/material.dart';

import 'app_data.dart';

final kTextFieldDecoration = InputDecoration(
  hintText: 'Password',
  hintStyle: TextStyle(color: AppData.placeholderColor),
  contentPadding: EdgeInsets.only(left: 30, right: 10, top: 20, bottom: 20),
  filled: true,
  fillColor: AppData.textFieldFillColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide.none,
  ),
);

final kOtherSignInTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);

final kSearchFoodDecoration = InputDecoration(
  hintText: 'Search Food',
  hintStyle: TextStyle(color: AppData.placeholderColor),
  contentPadding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
  filled: true,
  fillColor: AppData.textFieldFillColor,
  prefixIcon: Icon(Icons.search, size: 30, color: AppData.secondaryFontColor),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide.none,
  ),
);
