import 'dart:async';

import 'package:ecommerce_app/controllers/connection_manager_controller.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/repositories/products_repository.dart';
import '../../models/login/User.dart';
import '../../models/products/DummyProductsResponse.dart';
import '../../models/products/Product.dart';
import '../../utils/db_constants.dart';

class SearchProductController extends GetxController {
  final ProductsRepository _productsRepository = ProductsRepository();
  Rx<User?> user = User().obs;
  var isLoading = false.obs;

  var box;

  RxString token = "".obs;
  RxList<Products> products = <Products>[].obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      logItem("we are here oooo");
      box = await Hive.openBox(DBConstants.productBox); // open box
    });
  }

  Timer? _debounce;


  Future<void> searchText(String searchText) async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    // if (idFromFirstController.value == 0) {
    //   showNoInternetSnackBar();
    //   return;
    // }

    logItem("kdkkdkd----"+searchText!);

    if (searchText.isEmpty) {
     products.clear();
      return;
    }
    isLoading.value = true;

    try {
        Response? response = await _productsRepository.searchProduct(searchText);

        if (response!.body == null) {
          isLoading.value = false;

          return;
        }

        // isNetworkTimeout.value = false;

        // ignore: unrelated_type_equality_checks
        if (response.statusCode == 200) {
          logItem(response.body);
          logItem("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
          isLoading.value = false;

          products.value =
          DummyProductsResponse.fromJson(response.body)!.products!;

          logItem(products.length);

          update();
        } else {
          isLoading.value = false;

        }
      } catch (e) {
        isLoading.value = false;

        logItem(e);

      }
    }
  }

