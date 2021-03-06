import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/views/app_services.dart';
import 'package:meal_monkey/views/common.dart';
import 'package:meal_monkey/views/home.dart';
import 'package:meal_monkey/views/login.dart';
import 'package:meal_monkey/views/new_password.dart';
import 'package:meal_monkey/views/reset_password.dart';
import 'package:meal_monkey/views/send_otp.dart';
import 'package:meal_monkey/views/sign_up.dart';

import 'firebase_options.dart';
import 'models/custom_user.dart';
import 'views/welcome.dart';

Future<bool> checkIfInstalled() async {
  GetStorage box = GetStorage();
  bool isInstalled = box.read('installed') ?? false;
  if (!isInstalled) box.write('installed', true);
  return isInstalled;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  bool isInstalled = await checkIfInstalled();
  bool isLogin = CustomUser.currentUser != null;
  runApp(MyApp(isInstalled: isInstalled, isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  MyApp({required this.isInstalled, required this.isLogin});
  final bool isInstalled;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppData.appName,
      // initialRoute: LoginScreen.id,
      initialRoute: isInstalled
          ? isLogin
              ? Common.id
              : Welcome.id
          : AppServices.id,
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
