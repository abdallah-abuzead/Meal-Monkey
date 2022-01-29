import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  static const String id = '/sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var name, email, mobileNo, address, password, confirmPassword;
  bool _showEmailError = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 5),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText('Sign Up'),
              SizedBox(height: 17),
              smallText('Add your details to sign up'),
              SizedBox(height: 26),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Name')),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Email')),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Mobile No')),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Address')),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Confirm Password')),
              SizedBox(height: 25),
              RoundedButton(
                color: AppData.mainColor,
                child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 16)),
                onPressed: () {},
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  smallText('Already have an Account? '),
                  Text('Login', style: TextStyle(color: AppData.mainColor, fontWeight: FontWeight.bold)),
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
