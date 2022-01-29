import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  static const String id = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: Image.asset('images/organe_top_shape.png', width: Get.width, height: 420, fit: BoxFit.cover),
                  ),
                  Positioned(left: (Get.width - 104) / 2, top: 290, child: Image.asset('images/monkey_face.png')),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    logoText(),
                    SizedBox(height: 35),
                    smallText(
                      'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
                      fontSize: 13,
                    ),
                    SizedBox(height: 50),
                    RoundedButton(
                      color: AppData.mainColor,
                      child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                      onPressed: () {},
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      color: Colors.white,
                      child: Text('Create an Account', style: TextStyle(color: AppData.mainColor, fontSize: 16)),
                      hasBorder: true,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: AppData.primaryFontColor, thickness: 5, indent: 130, endIndent: 130),
        ],
      ),
    );
  }
}
