import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/models/products/Product.dart';
import 'package:ecommerce_app/modules/product_details/product_details_controller.dart';
import 'package:ecommerce_app/res/color_palette.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../components/cart_button.dart';
import '../../components/goto_cart.dart';
import '../../configs/routes_contants.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Products product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsController loginController =
      Get.put(ProductDetailsController());
  final _formKey = GlobalKey<FormState>();

  var remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(
          () => BaseScreen(
            title: "",
            useToolBar: true,
            rightIcon: GotoCart(
                noOfItems: loginController.items.length,
                onPress: () =>
                    context.pushNamed(AppRoutes.homeProductCart.name)),
            onPress: () => context.pop(),
            showBackBtn: true,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: widget.product.id!,
                      child: Image.network(
                        widget.product.thumbnail!,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 19.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemSize: 20,
                        itemPadding: const EdgeInsets.only(right: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const Icon(
                        CupertinoIcons.heart,
                        color: primaryColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          formatMoney(widget.product.price!),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Product Details",
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.product.description!,
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CartButton(
                          image: "assets/images/add_to_cart_bg.png",
                          text: "Add to Cart",
                          onPress: () {
                            loginController.addToCart(widget.product);
                          }),
                      CartButton(
                          image: "assets/images/buy_now_bg.png",
                          text: "Buy Now",
                          onPress: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
