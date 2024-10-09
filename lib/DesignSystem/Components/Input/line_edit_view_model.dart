import 'package:flutter/material.dart';

enum Variants {
  normal,
  error,
  disabled,
}

enum Sizes {
  small,
  medium,
  large,
}

enum Types {
  text,
  password,
  email,
  number,
}

enum BorderSizes {
  thin,
  normal,
  thick,
}

class LineEditViewModel {
  final Variants variant;
  final Sizes size;
  final Types type;
  final IconData? icon;
  final String? placeholder;
  final BorderSizes? borderSize;

  LineEditViewModel(
      {required this.variant,
      required this.size,
      required this.type,
      this.icon,
      this.placeholder,
      this.borderSize});
}
