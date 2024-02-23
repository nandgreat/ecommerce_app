import 'package:ecommerce_app/configs/routes_contants.dart';
import 'package:ecommerce_app/models/products/FakeApiProducts.dart';
import 'package:ecommerce_app/modules/bottom_nav/bottom_bar.dart';
import 'package:ecommerce_app/modules/home/home_screen.dart';
import 'package:ecommerce_app/modules/login/login_screen.dart';
import 'package:ecommerce_app/modules/product_details/product_details_screen.dart';
import 'package:ecommerce_app/modules/verify_otp/verify_otp.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../models/products/AnotherFakeApiProduct.dart';
import '../modules/signup/signup_screen.dart';
import '../utils/local_storage_helper.dart';

GoRouter provideGoRouter() {
  return GoRouter(
    initialLocation: AppRoutes.login.path,
    routes: [
      GoRoute(
        name: AppRoutes.login.name,
        path: AppRoutes.login.path,
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) async {
          LocalStorageHelper localStorageHelper = LocalStorageHelper();
          String? user = await localStorageHelper.retrieveItem(key: "user");

          if (user != null) {
            return AppRoutes.rootHome.path;
          } else {
            return null;
          }
        },
        routes: [
          GoRoute(
            path: AppRoutes.loginSignup.path,
            name: AppRoutes.loginSignup.name,
            builder: (context, state) => const SignupScreen(),
            routes: [
              GoRoute(
                path: AppRoutes.signupVerifyOtp.path,
                name: AppRoutes.signupVerifyOtp.name,
                builder: (context, state) =>
                    VerifyOtpScreen(email: state.pathParameters['email']!),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.rootHome.name,
        path: AppRoutes.rootHome.path,
        builder: (context, state) => const BottomBarNav(),
        routes: [
          GoRoute(
            path: AppRoutes.homeProductDetails.path,
            name: AppRoutes.homeProductDetails.name,
            builder: (context, state) {
              AnotherFakeApiProduct product = state.extra as AnotherFakeApiProduct; // 👈 casting is important

              return ProductDetailsScreen(product: product);
              },
          ),
        ],
      ),
    ],
  );
}
