import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:untitled/DesignSystem/Components/InputField/input_text.dart';
import 'package:untitled/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:untitled/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:untitled/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:untitled/Scenes/signUpPage/signup_router.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;
  Color checkBoxColor = Colors.white;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Padding(
          padding: const EdgeInsets.only(top: 120, bottom: 70),
          child: SizedBox(
            width: 150,
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    Image.asset('assets/placeholder.png', fit: BoxFit.cover)),
          )),
      // LineEdit.instantiate(viewModel: LineEditViewModel(size: Sizes.medium, type: Types.email, variant: Variants.normal, placeholder: 'Email')),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: StyledInputField.instantiate(
            viewModel: InputTextViewModel(
                isEnabled: true,
                controller: emailController,
                placeholder: 'E-mail',
                password: false,
                borderMode: BorderMode.none)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: StyledInputField.instantiate(
            viewModel: InputTextViewModel(
                isEnabled: true,
                controller: TextEditingController(),
                placeholder: 'Password',
                password: true,
                borderMode: BorderMode.none)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
                value: isChecked,
                checkColor: Colors.white,
                activeColor: Colors.white,
                hoverColor: Colors.white,
                shape: const CircleBorder(),
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => checkBoxColor),
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                    checkBoxColor = isChecked ? Colors.black : Colors.white;
                  });
                }),
            LinkedLabel.instantiate(
                viewModel: LinkedLabelViewModel(
                    fullText: 'I have read and agree to the Terms & Services',
                    linkedText: 'Terms & Services',
                    onLinkTap: () {})),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ActionButton.instantiate(
            viewModel: ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: 'Sign Up',
                onPressed: () {
                  SignUpRouter.goToProfilePage(context, emailController.text);
                })),
      ),
      Padding(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Text("Don't have an account?"),
            ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                    size: ActionButtonSize.medium,
                    style: ActionButtonStyle.primary,
                    text: 'Login',
                    onPressed: () {
                      SignUpRouter.goToLoginPage(context);
                    }))
          ],
        ),
      ),
    ])));
  }
}
