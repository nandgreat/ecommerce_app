import 'package:ecommerce_app/modules/home/home_screen.dart';

import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../res/color_palette.dart';
import '../../utils/local_storage_helper.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';

import '../cart/cart_screen.dart';
import '../favourites/favourites_screen.dart';
import '../setting/setting_screen.dart';

class BottomBarNav extends StatefulWidget {
  const BottomBarNav({Key? key}) : super(key: key);

  @override
  State<BottomBarNav> createState() => _BottomBarNavState();
}

class _BottomBarNavState extends State<BottomBarNav> {
  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  int visit = 0;

  static const List<TabItem> items = [
    TabItem(
      icon: Icons.home_filled,
    ),
    TabItem(
      icon: CupertinoIcons.heart_fill,
    ),
    TabItem(
      icon: CupertinoIcons.cart_fill,
    ),
    TabItem(
      icon: CupertinoIcons.gear,
    ),
  ];

  getUserInfo() async {
    LocalStorageHelper localStorageHelper = LocalStorageHelper();
    String? user = await localStorageHelper.retrieveItem(key: "user");

    logItem(user);

    if (user != null) {
      // Get.to(HomeScreen());
    }
  }

  List<Widget> pages = [
    HomeScreen(),
    FavouritesScreen(),
    CartScreen(),
    SettingScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: pages[visit],
      bottomNavigationBar: BottomBarInspiredInside(
        items: items,
        backgroundColor: Colors.white,
        colorSelected: Colors.white,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
        chipStyle: const ChipStyle(
            convexBridge: true, background: primaryColor, color: primaryColor),
        itemStyle: ItemStyle.circle,
        color: Colors.grey.shade400,
        iconSize: 30.0,
      ),
    );
  }
}
