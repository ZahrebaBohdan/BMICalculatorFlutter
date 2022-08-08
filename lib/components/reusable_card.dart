import 'dart:ui';

import 'package:flutter/material.dart';



class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.color,
      this.cardChild,
      this.onPress,
      this.height,
      this.width});

  final Color color;
  final double? height;
  final double? width;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.fromLTRB(5, 15, 5, 15),
        child: cardChild,
      ),
    );
  }
}
