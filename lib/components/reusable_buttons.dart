import 'package:flutter/material.dart';

import '../constants.dart';



class RoundedRectangleButton extends StatelessWidget {
  RoundedRectangleButton({this.child, this.color, this.onPressed});
  final dynamic child;
  final Color? color;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: color,
        // elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        constraints: const BoxConstraints.tightFor(height: 56, width: 56),
        child: child,
        onPressed: onPressed);
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});
  final VoidCallback? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kbottomContainerColor,
        width: double.infinity,
        height: 80,
        // padding: EdgeInsets.only(bottom: 10),
        child: Center(
            child: Text(
          buttonTitle!,
          style: kLargelabelButtonTextStyle,
        )),
      ),
    );
  }
}
