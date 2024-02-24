import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/modules/login/login_controller.dart';
import 'package:ecommerce_app/res/color_palette.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animation_components/fadein_up_anim.dart';
import '../../animation_components/slidein_up_anim.dart';
import '../../components/auth_footer.dart';
import '../../components/custom_text_input.dart';
import '../../components/float_right_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  var remember = false;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  handleLogin() {
    hideKeyboard(context);

    setState(() {
      _autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (_formKey.currentState!.validate()) {
      loginController.login(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BaseScreen(
          title: "",
          useToolBar: false,
          showBackBtn: false,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome\nBack!",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      hintText: 'Enter Email',
                      label: "Email",
                      functionValidate: validateEmailInput,
                      controller: loginController.emailController,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey[900]!,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      label: "Password",
                      togglePassword: true,
                      controller: loginController.passwordController,
                      obscureText: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[900]!,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FadeInAnimationWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatRightText(
                            text: "Forgot Password",
                            isBold: false,
                            onPress: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Obx(() => CustomButton(
                        label: "Login",
                        isLoading: loginController.isLoading.value,
                        onPressed: handleLogin)),
                    const SizedBox(
                      height: 70.0,
                    ),
                    AuthFooterWidget(type: "login")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
