import 'package:flutter/material.dart';
import 'package:untitled/Scenes/loginPage/login_factory.dart';
import 'package:untitled/Scenes/profilePage/profile_factory.dart';

class SignUpRouter {
  static void goToLoginPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginPageFactory.create()));
  }

  static void goToProfilePage(BuildContext context, email) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfilePageFactory.create(email)));
  }
}
