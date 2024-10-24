import 'package:flutter/material.dart';
import 'package:untitled/Scenes/loginPage/login_view.dart';

class ProfileRouter {
  static void goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}