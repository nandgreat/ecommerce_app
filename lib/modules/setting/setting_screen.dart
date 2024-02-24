import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/configs/routes_contants.dart';
import 'package:ecommerce_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/custom_button.dart';
import '../../utils/local_storage_helper.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();


  handleLogout() {
    LocalStorageHelper localStorageHelper = LocalStorageHelper();
    localStorageHelper.clearAll();
    context.goNamed(AppRoutes.login.name);

  }
  var remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BaseScreen(
          title: "Checkout",
          useToolBar: true,
          rightIcon: InkWell(
            child: Stack(children: [
              Image.asset('assets/images/toolbar_cart.png'),
              const Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: primaryColor,
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
          onPress: () => context.pop(),
          showBackBtn: true,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),

                CustomButton(
                    label: "Logout",
                    onPressed: handleLogout),

                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
