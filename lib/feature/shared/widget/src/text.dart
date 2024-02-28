import 'package:flutter/material.dart';

class MyText extends Text {
  const MyText(
    String? label, {
    bool wrap = true,
    super.key,
    super.style,
    super.maxLines,
    super.textAlign,
  }) : super('$label', overflow: wrap ? TextOverflow.ellipsis : null);
}