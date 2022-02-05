import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';
import 'package:meal_monkey/components/spinner.dart';
import 'package:meal_monkey/constants.dart';
import 'package:meal_monkey/validation/validation_error.dart';
import 'package:meal_monkey/validation/validator.dart';
import 'package:meal_monkey/views/sign_up.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String id = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var email, password;
  bool _showEmailError = false;
  bool _showPasswordError = false;

  void login() async {
    setState(() => _showEmailError = false);
    setState(() => _showPasswordError = false);
    var formData = _formKey.currentState;
    if (formData!.validate()) {
      showSpinner();
      formData.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        // ============== if there is no errors ==============
        if (userCredential.credential == null) Get.offAllNamed(Home.id);
      } on FirebaseAuthException catch (e) {
        Get.back();
        if (e.code == 'user-not-found')
          setState(() => _showEmailError = true);
        else if (e.code == 'wrong-password')
          setState(() => _showPasswordError = true);
        else {
          setState(() => _showEmailError = true);
          setState(() => _showPasswordError = true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 5),
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                titleText('Login'),
                SizedBox(height: 17),
                smallText('Add your details to login'),
                SizedBox(height: 35),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Your Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) => Validator.emailValidator(email),
                  onSaved: (value) => email = value,
                ),
                ValidationError(errorMessage: 'Email is not found.', visible: _showEmailError),
                SizedBox(height: 25),
                TextFormField(
                  decoration: kTextFieldDecoration,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (password) => Validator.passwordLoginValidator(password),
                  onSaved: (value) => password = value,
                ),
                ValidationError(errorMessage: 'Incorrect password.', visible: _showPasswordError),
              ],
            ),
          ),
          SizedBox(height: 25),
          RoundedButton(
            color: AppData.mainColor,
            child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
            onPressed: () => login(),
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
              TextButton(
                child: Text('Sign Up', style: TextStyle(color: AppData.mainColor, fontWeight: FontWeight.bold)),
                onPressed: () => Get.offAndToNamed(SignUp.id),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: AppData.primaryFontColor, thickness: 5, indent: 100, endIndent: 100),
        ],
      ),
    );
  }
}
