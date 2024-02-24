import 'package:ecommerce_app/controllers/connection_manager_controller.dart';
import 'package:ecommerce_app/data/db/tables/db_products.dart';
import 'package:ecommerce_app/models/products/FakeApiProducts.dart';
import 'package:ecommerce_app/models/products/FakeApiProductsResponse.dart';
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
      box = await Hive.openBox('ecommerce_box'); // open box
    });
  }

  Future<void> getEmployees(BuildContext context) async {
    isLoading.value = true;

    var hiveEmployees = await getEmployeesFromHive();

    logItem("My Hive empl");
    logItem(hiveEmployees);

    if (hiveEmployees!.isNotEmpty) {
      hiveEmployees.forEach((element) {
        products.add(element);
      });
    } else {
      await loadProducts(context);
    }

    // filteredEmployees.value = employees;

    isLoading.value = false;
  }

  Future<List<dynamic>?> getEmployeesFromHive() async {
    var myList;

    box = await Hive.openBox('ecommerce_box'); // open box

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

        // This is ignored when a category id is specified
        // if (categoryId == null) {
        //   var count = 0;
        //   for (var sermon in praiseReportItems) {
        //     if (count <= 3) {
        //       trendingPraiseReports.add(sermon);
        //     }
        //     for (var category in praiseReportByCategories) {
        //       if (sermon.category!.id == category.id) {
        //         category.praise_reports?.add(sermon);
        //       }
        //     }
        //     count++;
        //   }
        // }
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
