import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/color_palette.dart';

class GotoCart extends StatelessWidget {
  final int? noOfItems;
  final VoidCallback onPress;

  const GotoCart({Key? key, required this.onPress, this.noOfItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Stack(children: [
        Image.asset('assets/images/toolbar_cart.png'),
        Positioned(
          right: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: primaryColor,
            child: Text(
              noOfItems.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
