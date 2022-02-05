import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';
import 'package:meal_monkey/components/spinner.dart';
import 'package:meal_monkey/models/custom_user.dart';
import 'package:meal_monkey/validation/validation_error.dart';
import 'package:meal_monkey/validation/validator.dart';
import 'package:meal_monkey/views/home.dart';
import 'package:meal_monkey/views/login.dart';

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

  void signUp() async {
    setState(() => _showEmailError = false);
    var formData = _formKey.currentState;
    if (formData!.validate()) {
      formData.save();
      showSpinner();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // =========== in success ==============
        if (userCredential.credential == null) {
          CustomUser user = CustomUser(name: name, email: email, mobileNo: mobileNo, address: address, password: password);
          await user.add();
          Get.offAllNamed(Home.id);
        }
        // =====================================
      } on FirebaseAuthException catch (e) {
        Get.back();
        if (e.code == 'email-already-in-use') setState(() => _showEmailError = true);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 5),
        children: [
          titleText('Sign Up'),
          SizedBox(height: 17),
          smallText('Add your details to sign up'),
          SizedBox(height: 26),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Name'),
                  keyboardType: TextInputType.text,
                  validator: (name) => Validator.nameValidator(name),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => name = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) => Validator.emailValidator(email),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => email = value,
                ),
                ValidationError(errorMessage: 'Email already exists!', visible: _showEmailError),
                SizedBox(height: 20),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Mobile No'),
                  keyboardType: TextInputType.phone,
                  validator: (mobileNo) => Validator.mobileNoValidator(mobileNo),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => mobileNo = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Address'),
                  keyboardType: TextInputType.streetAddress,
                  validator: (address) => Validator.addressValidator(address),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => address = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: kTextFieldDecoration,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (password) => Validator.passwordValidator(password),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) => password = value,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Confirm Password'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (confirmPassword) => Validator.confirmPasswordValidator(confirmPassword, password),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => confirmPassword = value,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          RoundedButton(
            color: AppData.mainColor,
            child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 16)),
            onPressed: () => signUp(),
          ),
          SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              smallText('Already have an Account? '),
              TextButton(
                child: Text('Login', style: TextStyle(color: AppData.mainColor, fontWeight: FontWeight.bold)),
                onPressed: () => Get.offAndToNamed(Login.id),
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
