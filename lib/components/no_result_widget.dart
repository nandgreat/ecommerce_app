

import 'package:flutter/material.dart';

import '../utils/helpers.dart';

class NoResultWidget extends StatelessWidget {
  final String title;

  const NoResultWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context) * 0.5,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/images/empty_records.png"),
            height: 100.0,
            width: 100,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
