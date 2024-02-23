import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'local_storage_helper.dart';

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

logout() {
  LocalStorageHelper localStorageHelper = LocalStorageHelper();
  localStorageHelper.clearAll();
  // Get.delete<CampusController>(force: true);
  // Get.delete<EventController>(force: true);
  // Get.offAll(const LandingScreen());
}

showSnackBar(BuildContext context,
    {required title, required message, required type}) {

  if (type == "error") {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }else if(type == "success"){
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }else{
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

generateRandomNumber() {
  Random random = new Random();
  return random.nextInt(900000) + 100000; // from 10 upto 99 included
}

get10Digits(String inputString) {
  return inputString.substring(inputString.length - 10);
}

logItem(item) {
  if (kDebugMode) {
    print(item);
  }
}

String formatDate(String date) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  var newStr = date.substring(0, 10);
  DateTime dateTime = dateFormat.parse(newStr);

  return dateFormat.format(dateTime);
}

String formatDateString(String date) {
  DateFormat dateFormat = DateFormat("yMMMMEEEEd");

  var newStr = '${date.substring(0, 10)} ${date.substring(11, 23)}';
  final result = DateFormat('yMMMEd').format(DateTime.parse(newStr));
  // DateTime dateTime = dateFormat.parse(newStr);

  return result;
}

String formatMoney(num input) {
  return "\$${NumberFormat.decimalPattern().format(input)}";
}

String? validateEmailInput(String email) {
  if (email.isEmpty) return "Email is required";

  if (!isEmailValid(email)) {
    return "Enter a valid email address";
  }
  return null;
}

bool getBooleanValue(String input) {
  return input.toLowerCase() == "yes";
}

Future<StreamSubscription> getConnectivity() async {
  return Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {},
      );
}

String? validatePhoneInput(String email) {
  if (email.isEmpty) return "Phone number is required";

  if (email.length != 11) {
    return "Enter a valid phone number";
  }
  return null;
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

showNoInternetSnackBar(BuildContext context) {
  showSnackBar(context,
      title: "Network Error", message: "No Internet Connection", type: 'error');
}
