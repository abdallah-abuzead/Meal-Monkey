import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/screens/app_services.dart';
import 'package:meal_monkey/screens/common.dart';
import 'package:meal_monkey/screens/home.dart';
import 'package:meal_monkey/screens/login.dart';
import 'package:meal_monkey/screens/new_password.dart';
import 'package:meal_monkey/screens/reset_password.dart';
import 'package:meal_monkey/screens/send_otp.dart';
import 'package:meal_monkey/screens/sign_up.dart';

import 'screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppData.appName,
      initialRoute: SignUp.id,
      getPages: [
        GetPage(name: Welcome.id, page: () => Welcome()),
        GetPage(name: Login.id, page: () => Login()),
        GetPage(name: SignUp.id, page: () => SignUp()),
        GetPage(name: ResetPassword.id, page: () => ResetPassword()),
        GetPage(name: SendOTP.id, page: () => SendOTP()),
        GetPage(name: NewPassword.id, page: () => NewPassword()),
        GetPage(name: AppServices.id, page: () => AppServices()),
        GetPage(name: Home.id, page: () => Home()),
        GetPage(name: Common.id, page: () => Common()),
      ],
    );
  }
}
