import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/color_palette.dart';
import '../res/images.dart';
import '../utils/helpers.dart';
import 'app_bar.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen(
      {Key? key,
      this.title,
      this.child,
      this.showBackBtn = true,
      this.onPress,
      this.usePadding = true,
      this.useToolBar = true,
      this.hasInternet = true,
      this.leftIcon,
      this.rightIcon,
      this.imageOpacity = 0.5})
      : super(key: key);
  final Widget? child;
  final VoidCallback? onPress;
  final String? title;
  final Widget? leftIcon;
  final double? imageOpacity;
  final bool? usePadding;
  final bool? hasInternet;
  final Widget? rightIcon;
  final bool? showBackBtn;
  final bool useToolBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: SizedBox(
        height: deviceHeight(context),
        child: Stack(
          children: [

            Column(
              children: [
                if (!hasInternet!)
                  Container(
                    width: deviceWidth(context),
                    height: 30,
                    color: Colors.red,
                    child: const Center(
                        child: Text(
                          "No Internet Connection",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(usePadding! ? 20.0 : 0.0),
                    child: Padding(
                      padding: EdgeInsets.only(top: useToolBar ? 60.0 : (!useToolBar && !hasInternet!) ? 20 : 0.0),
                      child: child ?? Container(),
                    ),
                  ),
                ),
              ],
            ),
            useToolBar
                ? Padding(
                    padding: hasInternet!
                        ? const EdgeInsets.all(8.0)
                        : const EdgeInsets.all(18.0),
                    child: useToolBar
                        ? CustomAppBar(
                            title: title ?? "",
                            showBackBtn: showBackBtn,
                            rightIcon: rightIcon,
                            leftIcon: leftIcon ??
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(CupertinoIcons.back),
                                ),
                            leftOnPress: onPress ?? () => Navigator.pop(context))
                        : Container(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
