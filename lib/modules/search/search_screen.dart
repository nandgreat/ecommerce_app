import 'dart:async';

import 'package:ecommerce_app/components/base_screen.dart';
import 'package:ecommerce_app/modules/search/search_controller.dart';
import 'package:ecommerce_app/res/color_palette.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../components/custom_text_input.dart';
import '../../components/product_item.dart';
import '../../configs/routes_contants.dart';
import '../../models/products/Product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchProductController searchController = Get.put(SearchProductController());
  final _formKey = GlobalKey<FormState>();

  var remember = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.emailController.clear();
    searchController.products.clear();
    super.dispose();
  }

  Timer? _debounce;

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      searchController.searchText(query);
    });
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Icon(CupertinoIcons.left_chevron),
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Search any product',
                            label: "Search",
                            autofocus: true,
                            inputPadding: 15.0,
                            backgroundColor: Colors.white,
                            onChange: _onSearchChanged,
                            controller: searchController.emailController,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[500]!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    searchController.isLoading.value
                        ? const Expanded(
                            child: SpinKitRing(color: primaryColor, size: 50.0),
                          )
                        : Expanded(
                            child: Container(
                                child: MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              itemCount: searchController.products.length,
                              crossAxisSpacing: 2,
                              itemBuilder: (context, index) {
                                Products product =
                                    searchController.products[index];
                                return ProductItem(
                                    onPress: () =>
                                        context
                                            .pushNamed(
                                                AppRoutes
                                                    .homeSearchProductDetails
                                                    .name,
                                                extra: {
                                              'index': index,
                                              'product': product!
                                            }),
                                    index: index,
                                    product: product);
                              },
                            )),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
