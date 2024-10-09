import 'package:flutter/material.dart';

enum BorderMode { none, underline, box }

class InputTextViewModel {
  final TextEditingController controller;
  final String placeholder;
  bool password;
  final Widget? suffixIcon;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final VoidCallback? togglePasswordVisibility;
  final BorderMode borderMode;

  InputTextViewModel({
    required this.controller,
    required this.placeholder,
    required this.password,
    this.suffixIcon,
    this.isEnabled = true,
    this.validator,
    this.togglePasswordVisibility,
    this.borderMode = BorderMode.underline,
  });
}
