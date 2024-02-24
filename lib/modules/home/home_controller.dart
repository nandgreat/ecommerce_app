import 'package:ecommerce_app/controllers/connection_manager_controller.dart';
import 'package:ecommerce_app/data/db/tables/db_products.dart';
import 'package:ecommerce_app/models/products/FakeApiProducts.dart';
import 'package:ecommerce_app/models/products/FakeApiProductsResponse.dart';
import 'package:ecommerce_app/utils/db_constants.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/db/local_entity_repo.dart';
import '../../data/repositories/products_repository.dart';
import '../../models/login/User.dart';
import '../../models/products/AnotherFakeApiProduct.dart';
import '../../models/products/DummyProductsResponse.dart';
import '../../models/products/Product.dart';

class HomeController extends GetxController {
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

  Future<void> getProducts(BuildContext context) async {
    isLoading.value = true;

    // First Attempts to get product from local storage
    var localProducts = await getProductsFromLocatStorage();

    logItem("My Hive empl");
    logItem(localProducts);

    // Checks if products exist in local storage
    if (localProducts!.isNotEmpty) {
      localProducts.forEach((element) {
        products.add(element);
      });
    } else {
      // Loads Products from online if not found in local storage
      await loadProducts(context);
    }

    // filteredEmployees.value = employees;

    isLoading.value = false;
  }

  Future<List<dynamic>?> getProductsFromLocatStorage() async {
    var myList;

    box = await Hive.openBox(DBConstants.productBox); // open box

    try {
      logItem("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      myList = await box.get('products', defaultValue: []);
    } catch (error) {
      logItem("###############################################");
      logItem(error);
    }

    var newlist = [];
    if (myList != null) {
      newlist = myList;

      logItem("ˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ");
      logItem(newlist);
    }

    return newlist;
  }

  Future<void> loadProducts(BuildContext context) async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    // if (idFromFirstController.value == 0) {
    //   showNoInternetSnackBar();
    //   return;
    // }
    isLoading.value = true;

    try {
      Response? response = await _productsRepository.loadProducts();

      if (response!.body == null) {
        isLoading.value = false;

        return;
      }

      // isNetworkTimeout.value = false;

      // ignore: unrelated_type_equality_checks
      if (response.statusCode == 304 || response.statusCode == 200) {
        logItem(response.body);
        logItem("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
        isLoading.value = false;

        products.value =
            DummyProductsResponse.fromJson(response.body)!.products!;

        box.put('products', products.value);

        logItem(products.length);

        update();
      } else {
        isLoading.value = false;

        showSnackBar(context,
            title: "Error", message: "Failed to fetch Products", type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem(e);

      showSnackBar(context,
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }
}
