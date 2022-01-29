import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';
import 'package:meal_monkey/constants.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static const String id = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 5),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText('Login'),
              SizedBox(height: 17),
              smallText('Add your details to login'),
              SizedBox(height: 35),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Your Email')),
              SizedBox(height: 25),
              TextField(decoration: kTextFieldDecoration),
              SizedBox(height: 25),
              RoundedButton(
                color: AppData.mainColor,
                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                onPressed: () {},
              ),
              SizedBox(height: 25),
              smallText('Forgot your password?'),
              SizedBox(height: 40),
              smallText('or Login With'),
              SizedBox(height: 28),
              RoundedButton(
                color: AppData.facebookColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('f', style: kOtherSignInTextStyle.copyWith(fontSize: 24)),
                    SizedBox(width: 32),
                    Text('Login with Facebook', style: kOtherSignInTextStyle),
                  ],
                ),
                onPressed: () {},
              ),
              SizedBox(height: 28),
              RoundedButton(
                color: AppData.googleColor,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('G+', style: kOtherSignInTextStyle.copyWith(fontSize: 16)),
                    SizedBox(width: 32),
                    Text('Login with Google', style: kOtherSignInTextStyle),
                  ],
                ),
              ),
              SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  smallText('Don\'t have an Account? '),
                  Text('Sign Up', style: TextStyle(color: AppData.mainColor, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20),
              Divider(color: AppData.primaryFontColor, thickness: 5, indent: 100, endIndent: 100),
            ],
          ),
        ],
      ),
    );
  }
}
