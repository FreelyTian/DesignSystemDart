import 'package:flutter/material.dart';
import 'package:untitled/Scenes/profilePage/profile_factory.dart';
import 'package:untitled/Scenes/signUpPage/signup_factory.dart';

class LoginRouter {
  static void goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePageFactory.create()),
    );
  }

  static void goToSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpFactory.create()),
    );
  }
}
