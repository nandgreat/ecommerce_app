import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/models/products/DummyProductsResponse.dart';
import 'package:ecommerce_app/models/products/FakeApiProducts.dart';
import 'package:ecommerce_app/modules/home/home_controller.dart';
import 'package:ecommerce_app/res/color_palette.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../components/custom_text_input.dart';
import '../../components/home_toolbar.dart';
import '../../components/product_item.dart';
import '../../models/products/AnotherFakeApiProduct.dart';
import '../../models/products/Product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController loginController = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();

  var remember = false;

  @override
  void initState() {
    loginController.getEmployees(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: BaseScreen(
            title: "",
            useToolBar: false,
            showBackBtn: false,
            child: Obx(
              () => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: !loginController.isLoading.value
                    ? Column(
                        children: [
                          const HomeToolbar(),
                          CustomTextField(
                            hintText: 'Search any product',
                            label: "Search",
                            inputPadding: 15.0,
                            backgroundColor: Colors.white,
                            controller: loginController.emailController,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[500]!,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Expanded(
                            child: Container(
                                child: MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              itemCount: loginController.products.length,
                              crossAxisSpacing: 2,
                              itemBuilder: (context, index) {
                                Products product =
                                    loginController.products[index];
                                return ProductItem(
                                    index: index, product: product);
                              },
                            )),
                          ),
                        ],
                      )
                    : SpinKitRing(color: primaryColor, size: 50.0),
              ),
            ),
          ),
        ));
  }
}
