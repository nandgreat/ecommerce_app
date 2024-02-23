
import 'package:ecommerce_app/modules/signup/signup_controller.dart';
import 'package:ecommerce_app/modules/verify_otp/verify_otp_controller.dart';
import 'package:get/get.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpController());
  }
}