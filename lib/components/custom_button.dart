import 'package:ecommerce_app/animation_components/easein_anim.dart';
import 'package:ecommerce_app/animation_components/slidein_up_anim.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../res/color_palette.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Widget? icon;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  const CustomButton(
      {Key? key,
      required this.label,
      this.icon,
      this.isLoading = false,
      this.backgroundColor,
      this.labelColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInAnimationWidget(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: isLoading ? null : onPressed,
              child: Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: isLoading ? Colors.grey[600]! : (backgroundColor ?? primaryColor),
                ),
                child: isLoading
                    ? Row(
                        mainAxisAlignment: icon == null
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.center,
                        children: [
                            const SpinKitCircle(
                              size: 30.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Please wait",
                              style: TextStyle(fontSize: 18.0, color: labelColor ?? Colors.white),
                            )
                          ])
                    : Row(
                        mainAxisAlignment: icon == null
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.center,
                        children: [
                            icon ?? const SizedBox(),
                            icon != null
                                ? const SizedBox(
                                    width: 20.0,
                                  )
                                : const SizedBox(),
                            Text(
                              label,
                              style: TextStyle(fontSize: 18.0, color: labelColor ?? Colors.white),
                            )
                          ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
