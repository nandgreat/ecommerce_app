import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/components/cart_item_widget.dart';
import 'package:ecommerce_app/modules/product_details/product_details_controller.dart';
import 'package:ecommerce_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../components/favourite_item_widget.dart';
import '../../components/goto_cart.dart';
import '../../configs/routes_contants.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  ProductDetailsController cartController = Get.put(ProductDetailsController());
  final _formKey = GlobalKey<FormState>();

  var remember = false;

  @override
  void initState() {
    cartController.getFavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(()=> BaseScreen(
            title: "Favourites",
            useToolBar: true,
            rightIcon: GotoCart(
                noOfItems: cartController.favourites.length,
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
                      itemCount: cartController.favourites.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var newItem = cartController.favourites[index];
                        return FavouriteItemWidget(
                          onAddToCartPress: () async =>  cartController.addToCart(newItem, context),
                          onRemovePress: () => cartController.removeFromFavourite(index: index, context: context ),
                          title: newItem.title,
                            amount: newItem.price.toString(),
                          image: newItem.thumbnail,
                        );
                      }),
            ),
          ),
        ),
      ),
    );
  }
}
