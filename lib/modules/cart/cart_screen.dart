import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/components/cart_item_widget.dart';
import 'package:ecommerce_app/modules/product_details/product_details_controller.dart';
import 'package:ecommerce_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../components/goto_cart.dart';
import '../../configs/routes_contants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProductDetailsController cartController = Get.put(ProductDetailsController());
  final _formKey = GlobalKey<FormState>();

  var remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(()=> BaseScreen(
            title: "Checkout",
            useToolBar: true,
            rightIcon: GotoCart(
                noOfItems: cartController.items.length,
                onPress: () =>
                    context.pushNamed(AppRoutes.homeProductCart.name)),
            onPress: () => context.pop(),
            showBackBtn: true,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child:
                  ListView.builder(
                      shrinkWrap: false,
                      primary: true,
                      itemCount: cartController.items.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var newItem = cartController.items[index];
                        return CartItemWidget(
                          onRemovePress: () => cartController.removeFromCart(newItem.title),
                          title: newItem.title,
                            amount: newItem.amount.toString(),
                          quantity: newItem.quantity.toString(),
                          total: newItem.totalAmount.toString(),
                          image: newItem.image,
                        );
                      }),
            ),
          ),
        ),
      ),
    );
  }
}
