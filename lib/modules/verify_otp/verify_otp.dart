import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/otp_box.dart';
import 'package:ecommerce_app/modules/verify_otp/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../utils/helpers.dart';

import '../../res/color_palette.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final VerifyOtpController verifyOtpController =
      Get.put(VerifyOtpController());

  List<String> otpValues = ['-1', '-1', '-1', '-1', '-1', '-1'];
  String otpValue = "AAAAAA";
  dynamic argumentData = Get.arguments;


  updateOtp(int index, String value, BuildContext context) {
    String newOtp = "";
    if (value.isEmpty) {
      newOtp = replaceCharAt(otpValue, index, "A");

      FocusScope.of(context).previousFocus();
    } else {
      newOtp = replaceCharAt(otpValue, index, value);
      FocusScope.of(context).nextFocus();
    }
    logItem(newOtp);
    setState(() => otpValue = newOtp);
  }

  handleVerifyOtp() {
    hideKeyboard(context);
    if (otpValue.contains("A")) {
      showSnackBar(context,
          title: "Error",
          message: "Kindly Enter the complete OTP to continue",
          type: 'error');
      return;
    }

    verifyOtpController.verifyOtp(otpValue, context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BaseScreen(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: deviceWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter OTP",
                          style: TextStyle(
                              height: 1,
                              fontSize: 28.0,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          child: Text(
                            "A six Digit code as been sent to\n${widget.email}",
                            style: const TextStyle(height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Form(
                    child: Row(children: [
                      OtpBoxWidget(onChanged: (value) {
                        updateOtp(0, value, context);
                      }),
                      OtpBoxWidget(onChanged: (value) {
                        updateOtp(1, value, context);
                      }),
                      OtpBoxWidget(onChanged: (value) {
                        updateOtp(2, value, context);
                      }),
                      OtpBoxWidget(onChanged: (value) {
                        updateOtp(3, value, context);
                      }),
                      OtpBoxWidget(onChanged: (value) {
                        updateOtp(4, value, context);
                      }),
                      OtpBoxWidget(onChanged: (value) {
                        updateOtp(5, value, context);
                      }),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Didn't receive code yet?",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(width: 5.0,),
                      InkWell(
                        onTap: () {
                        },
                        child: Text(
                          "Resend",
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (verifyOtpController.isResendLoading.value)
                        SpinKitFadingCircle(
                          color: primaryDarkColor,
                          size: 30,
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(() => CustomButton(
                      label: "Submit",
                      isLoading: verifyOtpController.isLoading.value,
                      onPressed: handleVerifyOtp))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
