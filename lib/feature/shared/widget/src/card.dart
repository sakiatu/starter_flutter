import 'package:flutter/material.dart';

import '../../../../core/const/size.dart';

class MyCard extends Card {
  MyCard({
    double paddingX = Gap.regular,
    double paddingY = Gap.regular,
    double radius = RadiusValue.regular,
    double stroke = 0,
    Color strokeColor = Colors.transparent,
    double maxHeight = double.infinity,
    double maxWidth = double.infinity,
    double minHeight = 0,
    double minWidth = 0,
    double? height,
    double? width,
    super.key,
    super.color,
    super.elevation = 1.0,
    required Widget child,
  }) : super(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius), side: BorderSide(width: stroke, color: strokeColor)),
            child: Container(
                height: height,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                constraints:
                    BoxConstraints(minHeight: minHeight, maxHeight: maxHeight, maxWidth: maxWidth, minWidth: minWidth),
                child: child));
}
