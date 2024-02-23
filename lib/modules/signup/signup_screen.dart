import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/modules/signup/signup_controller.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../animation_components/fadein_up_anim.dart';
import '../../components/auth_footer.dart';
import '../../components/custom_text_input.dart';
import '../../components/float_right_text.dart';
import '../../configs/routes_contants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController signupController = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

  var remember = false;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  handleLogin() {
    hideKeyboard(context);

    setState(() {
      _autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (_formKey.currentState!.validate()) {
      signupController.signup(context);
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
                          "Create an\naccount!",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      hintText: 'Enter Full name',
                      label: "Full name",
                      controller: signupController.fullnameController,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey[900]!,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      hintText: 'Enter Email',
                      label: "Email",
                      controller: signupController.emailController,
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
                      controller: signupController.passwordController,
                      obscureText: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[900]!,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      label: "Confirm Password",
                      togglePassword: true,
                      controller: signupController.confirmPasswordController,
                      obscureText: true,
                      functionValidate: signupController.validatePassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[900]!,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Obx(() => CustomButton(
                        label: "Create Account",
                        isLoading: signupController.isLoading.value,
                        onPressed: handleLogin)),
                    const SizedBox(
                      height: 70.0,
                    ),
                    AuthFooterWidget(type: 'signup')
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
