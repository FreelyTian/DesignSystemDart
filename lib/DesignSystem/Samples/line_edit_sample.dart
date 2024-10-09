import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Input/line_edit.dart';
import 'package:untitled/DesignSystem/Components/Input/line_edit_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LineEdit.instantiate(viewModel: LineEditViewModel(variant: Variants.normal, size: Sizes.medium, type: Types.text)),
            LineEdit.instantiate(viewModel: LineEditViewModel(variant: Variants.disabled, size: Sizes.medium, type: Types.text)),
            LineEdit.instantiate(viewModel: LineEditViewModel(variant: Variants.error, size: Sizes.medium, type: Types.text, placeholder: "erro mano!")),
            LineEdit.instantiate(viewModel: LineEditViewModel(variant: Variants.normal, size: Sizes.medium, type: Types.password,)),

          ],
          
        ),
      ),
    );
  }
}