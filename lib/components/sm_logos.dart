import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/color_palette.dart';

class SMLogosWidget extends StatelessWidget {
  final String logo;

  const SMLogosWidget({Key? key, required this.logo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            color: primaryColor.withOpacity(0.15),
            border: Border.all(color: primaryColor, width: 1.5)),
        child: Center(
            child: Image.asset(
              logo,
              height: 25.0,
              width: 25.0,
            )),
      ),
    );
  }
}
