import 'package:ecommerce_app/animation_components/fadein_up_anim.dart';
import 'package:ecommerce_app/components/sm_logos.dart';
import 'package:ecommerce_app/configs/routes_contants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../animation_components/slidein_up_anim.dart';
import '../res/color_palette.dart';

class AuthFooterWidget extends StatelessWidget {
  final String type;

  const AuthFooterWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("- OR Continue with -"),
        const SizedBox(
          height: 20.0,
        ),
        const FadeInAnimationWidget(
          delay: Duration(milliseconds: 500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SMLogosWidget(logo: "assets/images/google_icon.png"),
              SMLogosWidget(logo: "assets/images/apple_icon.png"),
              SMLogosWidget(logo: "assets/images/facebook_icon.png"),
            ],
          ),
        ),
        SlideInAnimationWidget(
          child: InkWell(
            onTap: () {
             type == "login" ? context.push(
                  "${AppRoutes.login.path}/${AppRoutes.loginSignup.path}") : context.pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    type == "login" ? "Create An Account " : "I Already Have an Account ",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                   type == "login" ? "Sign up" : "Login",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
