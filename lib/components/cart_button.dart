import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/color_palette.dart';

class CartButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPress;

  const CartButton({Key? key, required this.image, required this.text,required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40.0,
        width: 140.0,
        decoration:
        BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
