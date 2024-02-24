import 'package:ecommerce_app/configs/routes_contants.dart';
import 'package:ecommerce_app/controllers/connection_manager_controller.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/models/login/LoginRequest.dart';
import 'package:ecommerce_app/models/login/LoginResponse.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:ecommerce_app/utils/local_storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../models/login/User.dart';

class LoginController extends GetxController {

  //Initializing the Auth Repository
  final AuthRepository _authRepository = AuthRepository();
  Rx<User?> user = User().obs;
  var isLoading = false.obs;

  RxString token = "".obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //Initializing Connection Manager Controller to detect network change
  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  Future<void> login(BuildContext context) async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    //Checking For internet connection
    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar(context);
      return;
    }

    isLoading.value = true;

    var email = emailController.text.trim();

    //Login Request Class
    LoginRequest loginRequest = LoginRequest(
        id: emailController.text.trim(),
        deviceToken: token.value.trim(),
        password: passwordController.text.trim());


    try {
      // Network Request
      Response? response = await _authRepository.login(loginRequest);

      // Check for Poor internet Connection
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
        isLoading.value = false;

        user.value = LoginResponse.fromJson(response.body).data?.user;
        var token = LoginResponse.fromJson(response.body).data?.token;
        String userString = userToJson(user.value!);

        // Initializing the Local storage helper class
        LocalStorageHelper localStorageHelper = LocalStorageHelper();

        // Store the user token
        await localStorageHelper.storeItem(key: "token", value: token!);

        // Storage the User String to secure storage
        await localStorageHelper.storeItem(key: "user", value: userString);


        context.pushReplacementNamed(AppRoutes.rootHome.name);

        update();

        // Runs when the User has not completed their registration
      } else if (response.statusCode == 402) {
        var message = LoginResponse.fromJson(response.body).message.toString();

        showSnackBar(context, title: "OTP Verification", message: message, type: 'warn');
      } else {
        isLoading.value = false;

        var message = LoginResponse.fromJson(response.body).message.toString();

        logItem(message);

        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        showSnackBar(context, title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem("???????????????????????????????????????????");
      logItem(e);

      showSnackBar(context,
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }
}
