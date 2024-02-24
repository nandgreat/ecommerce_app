import 'dart:io';

import 'package:ecommerce_app/data/db/tables/cart_items.dart';
import 'package:ecommerce_app/data/db/tables/db_products.dart';
import 'package:ecommerce_app/res/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'configs/go_router_config.dart';
import 'models/products/AnotherFakeApiProduct.dart';
import 'models/products/Product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();

    Hive.registerAdapter(ProductsAdapter());
    Hive.registerAdapter(CartItemAdapter());
    await Hive.openBox('ecommerce_box');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: primaryColor,
    );
    return MaterialApp.router(
      theme: themeData,
      routerConfig: provideGoRouter(),
    );
  }
}
