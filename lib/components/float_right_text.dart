import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/color_palette.dart';

class FloatRightText extends StatelessWidget {
  final String? text;
  final bool? isBold;
  final Color? color;
  final VoidCallback onPress;

  const FloatRightText({Key? key, this.color = primaryColor, required this.text, this.isBold = true, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  [
          Text(
            text!,
            style: TextStyle(color: color, fontWeight: isBold! ? FontWeight.bold: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
