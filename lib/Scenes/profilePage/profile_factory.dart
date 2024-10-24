import 'package:flutter/material.dart';
import 'package:untitled/Scenes/profilePage/profile_view.dart';

class ProfilePageFactory {
  static Widget create(usr) {
      return ProfilePage(email: usr,); // Se possível, use const ProfilePage();
  }
}
