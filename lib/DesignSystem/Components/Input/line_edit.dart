import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Input/line_edit_view_model.dart';

class LineEdit extends StatelessWidget {
  final LineEditViewModel viewModel;

  const LineEdit._(this.viewModel);

  static Widget instantiate({required LineEditViewModel viewModel}) {
    return LineEdit._(viewModel);
  }

  Widget build(BuildContext context) {
    double size = 16.0;
    Color border_color = Colors.black38;
    double border_size = 16.0;
    String placeholder = "desabilitado";
    TextInputType key_type = TextInputType.text;


    switch (viewModel.variant) {
      case Variants.normal:
        border_color = Colors.black87;
      case Variants.disabled:
        border_color = Colors.black26;
      case Variants.error:
        border_color = Colors.redAccent;
    }

    switch (viewModel.type) {
      case Types.text:
        key_type = TextInputType.text;
      case Types.email:
        key_type = TextInputType.emailAddress;
      case Types.number:
        key_type = TextInputType.number;
      case Types.password:
        key_type = TextInputType.text;
    }

    switch (viewModel.size) {
      case Sizes.large:
        size = 256.0;
      case Sizes.medium:
        size = 178.0;
      case Sizes.small:
        size = 128.0;
    }

    if (viewModel.variant == Variants.disabled) {
      placeholder = "desabilitado";
    } else {
      placeholder = viewModel.placeholder ?? "";
    }

    switch (viewModel.borderSize) {
      case null:
        border_size = 1.0;
      case BorderSizes.thick:
        border_size = 8.0;
      case BorderSizes.normal:
        border_size = 4.0;
      case BorderSizes.thin:
        border_size = 0.5;
    }

    switch (viewModel.type) {
      case Types.text:
      case Types.email:
      case Types.number:
      case Types.password:
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: border_color,
                    width: border_size,
                    style: BorderStyle.solid)),
            errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: border_color, width: 1.0, style: BorderStyle.solid)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: border_color, width: 1.0, style: BorderStyle.solid)),
            disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: border_color, width: 1.0, style: BorderStyle.solid)),
            constraints: BoxConstraints(maxHeight: size, maxWidth: size * 2),
            enabled: viewModel.variant == Variants.disabled ? false : true,
            hintText: placeholder,
            hintStyle: TextStyle(color: border_color)),
            obscureText: viewModel.type == Types.password ? true : false,
            enableSuggestions: viewModel.type == Types.password ? false : true,
            autocorrect: viewModel.type == Types.password ? false : true,
        )
    );
  }
}
