import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';

class SendOTP extends StatelessWidget {
  const SendOTP({Key? key}) : super(key: key);
  static const String id = '/send_otp';

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
                titleText('We have sent an OTP to \n your Mobile', fontSize: 25),
                SizedBox(height: 17),
                smallText('Please check your mobile number 071*****12 \n continue to reset your password'),
                SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildStarContainer(),
                    buildStarContainer(),
                    buildStarContainer(),
                    buildStarContainer(),
                  ],
                ),
                SizedBox(height: 36),
                RoundedButton(
                  color: AppData.mainColor,
                  child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 16)),
                  onPressed: () {},
                ),
                SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallText('Didn\'t Receive? '),
                    Text('Click Here', style: TextStyle(color: AppData.mainColor, fontWeight: FontWeight.bold)),
                  ],
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
