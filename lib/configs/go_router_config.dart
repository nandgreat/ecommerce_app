import 'package:ecommerce_app/configs/routes_contants.dart';
import 'package:ecommerce_app/models/products/FakeApiProducts.dart';
import 'package:ecommerce_app/models/products/Product.dart';
import 'package:ecommerce_app/models/products/Product.dart';
import 'package:ecommerce_app/modules/bottom_nav/bottom_bar.dart';
import 'package:ecommerce_app/modules/cart/cart_screen.dart';
import 'package:ecommerce_app/modules/home/home_screen.dart';
import 'package:ecommerce_app/modules/login/login_screen.dart';
import 'package:ecommerce_app/modules/product_details/product_details_screen.dart';
import 'package:ecommerce_app/modules/search/search_screen.dart';
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
              Map<String, dynamic> args = state.extra as Map<String, dynamic>;
              // 👈 casting is important
              return ProductDetailsScreen(
                product: args['product'],
                index: args['index'],
              );
            },
            routes: [
              GoRoute(
                  path: AppRoutes.homeProductCart.path,
                  name: AppRoutes.homeProductCart.name,
                  builder: (context, state) => CartScreen())
            ],
          ),
          GoRoute(
              path: AppRoutes.homeSearch.path,
              name: AppRoutes.homeSearch.name,
              builder: (context, state) {
                return const SearchScreen();
              },
              routes: [
                GoRoute(
                  path: AppRoutes.homeSearchProductDetails.path,
                  name: AppRoutes.homeSearchProductDetails.name,
                  builder: (context, state) {
                    Map<String, dynamic> args =
                        state.extra as Map<String, dynamic>;
                    // 👈 casting is important
                    return ProductDetailsScreen(
                      product: args['product'],
                      index: args['index'],
                    );
                  },
                  routes: [
                    GoRoute(
                        path: AppRoutes.homeSearchProductDetailsCart.path,
                        name: AppRoutes.homeSearchProductDetailsCart.name,
                        builder: (context, state) => CartScreen())
                  ],
                ),
              ]),
        ],
      ),
    ],
  );
}
