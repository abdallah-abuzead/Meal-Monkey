import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';
import '../constants.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  static const String id = '/reset_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 55, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                titleText('Reset Password'),
                SizedBox(height: 17),
                smallText('Please enter your email to receive a \n link to  create a new password via email'),
                SizedBox(height: 60),
                TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Email')),
                SizedBox(height: 40),
                RoundedButton(
                  color: AppData.mainColor,
                  child: Text('Send', style: TextStyle(color: Colors.white, fontSize: 16)),
                  onPressed: () {},
                ),
              ],
            ),
            Divider(color: AppData.primaryFontColor, thickness: 5, indent: 100, endIndent: 100),
          ],
        ),
      ),
    );
  }
}
