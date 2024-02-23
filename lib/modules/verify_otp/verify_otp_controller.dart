import 'dart:convert';

import 'package:ecommerce_app/controllers/connection_manager_controller.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/models/login/LoginResponse.dart';

import 'package:ecommerce_app/modules/login/login_screen.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:ecommerce_app/utils/local_storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../configs/routes_contants.dart';
import '../../models/signup/SignupResponse.dart';

class VerifyOtpController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  var isLoading = false.obs;
  var isResendLoading = false.obs;

  var otpController = TextEditingController();

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  Future<void> verifyOtp(String otp, BuildContext context) async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar(context);
      return;
    }

    isLoading.value = true;

    try {
      Response? response = await _authRepository.verifyOtp(otp);

      if(response == null){
        showSnackBar(context,title: "Error", message: "Failed to Load, Kindly check your internet connection", type: 'error');
        return;
      }

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var user = LoginResponse.fromJson(response.body).data?.user;
        var message = LoginResponse.fromJson(response.body).message;
        // String userString = jsonEncode(user);
        // var token = LoginResponse.fromJson(response.body).data?.token;
        //
        // LocalStorageHelper localStorageHelper = LocalStorageHelper();
        // await localStorageHelper.storeItem(key: "user", value: userString);
        // await localStorageHelper.storeItem(key: "token", value: token!);

        otpController.clear();
        isLoading.value = false;
        showSnackBar(context,
            title: "Verification Success. Kindly Login to continue", message: message, type: 'success');

        context.pushNamed(AppRoutes.login.name);

      } else {
        isLoading.value = false;
        var message = SignupResponse.fromJson(response.body).message.toString();

        showSnackBar(context,title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem(e);

      showSnackBar(context,
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }

  void validateInput() {}
}
