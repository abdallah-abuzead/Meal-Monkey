import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';
import '../constants.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);
  static const String id = '/new_password';

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
                titleText('New Password'),
                SizedBox(height: 17),
                smallText('Please enter your email to receive a \n link to  create a new password via email'),
                SizedBox(height: 35),
                TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'New Password')),
                SizedBox(height: 30),
                TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Confirm Password')),
                SizedBox(height: 35),
                RoundedButton(
                  color: AppData.mainColor,
                  child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 16)),
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
