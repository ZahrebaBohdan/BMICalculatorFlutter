import 'package:flutter/material.dart';

import '../constants.dart';





class IconContent extends StatelessWidget {
  IconContent({this.icon, this.text});
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon!,
          color: Colors.white,
          size: 80,
        ),
        const SizedBox(height: 15),
        Text(text!, style: klabelTextStyle),
      ],
    );
  }
}
