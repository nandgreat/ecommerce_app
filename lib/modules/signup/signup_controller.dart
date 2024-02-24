import 'package:ecommerce_app/configs/routes_contants.dart';
import 'package:ecommerce_app/controllers/connection_manager_controller.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../models/signup/SignupRequest.dart';
import '../../models/signup/SignupResponse.dart';
import '../verify_otp/verify_otp.dart';

class SignupController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  var isLoading = false.obs;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var fullnameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  ConnectionManagerController connectionManagerController =
  Get.put(ConnectionManagerController());



  Future<void> signup(BuildContext context) async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar(context);
      return;
    }

    isLoading.value = true;

    String phoneNumber = emailController.text.toString().trim();

    SignupRequest signupRequest = SignupRequest(
        fullName: firstNameController.text,
        country: "Nigeria",
        username: "${firstNameController.text.trim()}${generateRandomNumber()}",
        email: emailController.text.trim(),
        isVendor: false,
        password: passwordController.text.trim());

    try {
      Response? response = await _authRepository.signup(signupRequest);

      if (response!.body == null) {
        showSnackBar(context,
            title: "Error",
            message: "Failed to Load, Kindly check your internet connection",
            type: 'error');
        isLoading.value = false;

        return;
      }

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var message = SignupResponse.fromJson(response.body).message;

        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        passwordController.clear();
        isLoading.value = false;

        showSnackBar(context,
            title: "Register Success", message: message, type: 'success');

        context.pushNamed(AppRoutes.signupVerifyOtp.name, pathParameters: {'email': signupRequest.email!});

      } else {
        isLoading.value = false;
        var message = SignupResponse.fromJson(response.body).message.toString();

        showSnackBar(context, title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem(e);

      showSnackBar(context,
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }

  String? validatePassword(String confirmPassword) {

    if(confirmPassword.isEmpty) return "Confirm Password is required";

    if(passwordController.text.isNotEmpty && confirmPassword != passwordController.text) {
      return "Confirm Password does not match";
    }
    return null;
  }
}
