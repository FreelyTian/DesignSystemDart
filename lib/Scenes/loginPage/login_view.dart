import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:untitled/DesignSystem/Components/InputField/input_text.dart';
import 'package:untitled/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:untitled/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:untitled/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:untitled/Scenes/loginPage/login_router.dart';
import 'package:untitled/Scenes/loginPage/login_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                placeholder: 'Email',
                password: false,
                borderMode: BorderMode.none)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: StyledInputField.instantiate(
            viewModel: InputTextViewModel(
                isEnabled: true,
                controller: passwordController,
                placeholder: 'Password',
                password: true,
                borderMode: BorderMode.none)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LinkedLabel.instantiate(
                viewModel: LinkedLabelViewModel(
                    fullText: 'Forgot Password',
                    linkedText: 'Forgot Password',
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
                text: 'Login',
                onPressed: () async {
                  try {
                    // Chama o método estático fetchLogin
                    Map<String, dynamic> userData =
                        await LoginService.fetchLogin(
                      emailController.text,
                      passwordController.text,
                    );
                    if (userData.isEmpty) {

                      throw Exception('Usuário ou senha inválidos');
                    } else {
                      LoginRouter.goToProfilePage(context, userData['name']);
                    }
                    // Navega para a ProfilePage usando o LoginRouter e passa os dados do usuário
                  } catch (e) {
                    //ERRO
                  }
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
                    text: 'Sign up',
                    onPressed: () async {
                      LoginRouter.goToSignUpPage(context);
                    }))
          ],
        ),
      ),
    ])));
  }
}
