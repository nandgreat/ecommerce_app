import 'package:ecommerce_app/configs/routes_contants.dart';
import 'package:ecommerce_app/controllers/connection_manager_controller.dart';
import 'package:ecommerce_app/data/db/models/product.dart';
import 'package:ecommerce_app/data/db/tables/cart_items.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/models/login/LoginRequest.dart';
import 'package:ecommerce_app/models/login/LoginResponse.dart';
import 'package:ecommerce_app/models/products/Product.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:ecommerce_app/utils/local_storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../models/login/User.dart';

class ProductDetailsController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  Rx<User?> user = User().obs;
  var isLoading = false.obs;

  RxString token = "".obs;
  var box;
  var box2;
  var items = [].obs;
  var favourites = [].obs;
  RxBool isFavourite = false.obs;

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
      box2 = await Hive.openBox('favourite_items_box');
      await getItems();
    });
  }

  getItems() async {
    try {
      logItem("§§§§§§§§§§§§§§§§§§§§§§§§");
      items.value = await box.get('cart_items', defaultValue: []);
    } catch (error) {
      logItem("###############################################");
      logItem(error);
    } //reversed so as to keep the new data to the top
  }

  checkFavourite(Products product) async {
    try {
      logItem("±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±");
      favourites.value = await box2.values.toList();
    } catch (error) {
      logItem("###############################################");
      logItem(error);
    } //reversed so as to keep the new data to the top

    if (favourites.isNotEmpty) {
      logItem(favourites[0]);

      var myIndex = favourites.indexWhere((element) {
        logItem("qqqqqqqqqqqq");
        logItem(element);
        return element.title == product.title;
      });

      if (myIndex != -1) {
        isFavourite.value = true;
      } else {
        isFavourite.value = false;
      }
    } else {
      isFavourite.value = false;

      logItem("favourite is empty ooo");
    }
  }

  getFavourite() async {
    favourites.value = [];
    try {
      logItem("±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±");
      favourites.value = await box2.values.toList();
    } catch (error) {
      logItem("###############################################");
      logItem(error);
    } //reversed so as to keep the new data to the top

  }

  addToCart(Products producct, BuildContext context) async {
    logItem("lllsjkdlkfsldkjfslkdj");

    var itemInCart = null;

    if (items.isNotEmpty) {
      logItem(items[0].title);
      items.forEach((element) {
        if (element.title == producct.title) {
          logItem("Ttotal is: ${element.totalAmount}");
          itemInCart = element;
        }
      });
    }

    if (itemInCart != null) {
      int itemIndex =
          items.indexWhere((element) => element.title == producct.title);
      logItem("lllsjkdlkfsldkjfslkdj $itemInCart");

      itemInCart.quantity = itemInCart.quantity + 1;
      itemInCart.totalAmount = itemInCart.totalAmount + itemInCart.amount;

      logItem("lllsjkdlkfsldkjfslkdj ${itemInCart.quantity}");

      items[itemIndex] = itemInCart;
    } else {
      CartItem dataModel = CartItem(
          title: producct.title,
          image: producct.thumbnail,
          description: producct.description,
          amount: int.parse(producct.price.toString()),
          quantity: 1,
          rating: double.parse(producct.rating.toString()),
          totalAmount: producct.price!.toInt());

      items.add(dataModel);
    }

    logItem(items);

    await box.put('cart_items', items);

    showSnackBar(context,
        title: "Added Successfuly",
        message: "Item Added to cart successfully",
        type: "success");
    // getItems();
  }

  addToFavourite(
      {required int index,
      required Products producct,
      required BuildContext context}) async {
    logItem("lllsjkdlkfsldkjfslkdj");

    favourites.add(producct);

    logItem(favourites);

    await box2.add(producct);

    await checkFavourite(producct);

    showSnackBar(context,
        title: "Added Successfuly",
        message: "Item Added to Favourite successfully",
        type: "success");
    // getItems();
  }

  removeFromCart(String title) async {
    logItem("lllsjkdlkfsldkjfslkdj $title");

    int itemIndex = items.indexWhere((element) => element.title == title);

    logItem("lllsjkdlkfsldkjfslkdj $itemIndex");

    items.removeAt(itemIndex);

    logItem(items);

    await box.put('cart_items', items);
    // getItems();
  }

  removeFromFavourite(
      {int? index, String? title, required BuildContext context}) async {
    int itemIndex = 0;

    itemIndex =
        index ?? favourites.indexWhere((element) => element.title == title);

    logItem("lllsjkdlkfsldkjfslkdj $itemIndex");

    favourites.removeAt(itemIndex);

    logItem(favourites);


    await box2.deleteAt(0);
    getFavourite();
  }

  Future<void> login(BuildContext context) async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar(context);
      return;
    }

    isLoading.value = true;

    var email = emailController.text.trim();

    LoginRequest loginRequest = LoginRequest(
        id: emailController.text.trim(),
        deviceToken: token.value.trim(),
        password: passwordController.text.trim());

    logItem("${emailController.text.trim()} 7777777");

    try {
      Response? response = await _authRepository.login(loginRequest);

      if (response == null) {
        showSnackBar(context,
            title: "Error",
            message: "Failed to Load, Kindly check your internet connection",
            type: 'error');
        return;
      }

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        user.value = LoginResponse.fromJson(response.body).data?.user;
        var token = LoginResponse.fromJson(response.body).data?.token;
        String userString = userToJson(user.value!);

        LocalStorageHelper localStorageHelper = LocalStorageHelper();
        await localStorageHelper.storeItem(key: "token", value: token!);
        await localStorageHelper.storeItem(key: "user", value: userString);

        context.pushReplacementNamed(AppRoutes.rootHome.name);

        update();
      } else if (response.statusCode == 402) {
        var message = LoginResponse.fromJson(response.body).message.toString();

        showSnackBar(context,
            title: "OTP Verification", message: message, type: 'warn');
      } else {
        isLoading.value = false;

        var message = LoginResponse.fromJson(response.body).message.toString();

        logItem(message);

        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        showSnackBar(context, title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem("???????????????????????????????????????????");
      logItem(e);

      showSnackBar(context,
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }
}
