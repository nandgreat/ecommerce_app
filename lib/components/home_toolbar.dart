import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/color_palette.dart';

class HomeToolbar extends StatelessWidget {
  const HomeToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/hamburger_icon.png",
            height: 40.0,
            width: 40.0,
          ),
          Image.asset(
            "assets/images/logo_with_text.png",
            height: 28.0,
            fit: BoxFit.contain,
          ),
          Image.asset(
            "assets/images/default_image.png",
            height: 40.0,
            width: 40.0,
          )
        ],
      ),
    );
  }
}
