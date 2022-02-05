import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSpinner() {
  return Get.defaultDialog(
    title: 'Please wait...',
    titleStyle: TextStyle(fontSize: 15),
    titlePadding: EdgeInsets.symmetric(vertical: 15),
    content: Center(child: CircularProgressIndicator()),
    contentPadding: EdgeInsets.all(15),
    radius: 5,
  );
}
