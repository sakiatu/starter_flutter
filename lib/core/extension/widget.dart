import 'package:flutter/material.dart';

import '../const/size.dart';

extension WidgetExtension on Widget {
  Widget center() => Center(child: this);

  Widget expand([int flex = 1]) => Expanded(flex: flex, child: this);

  Widget opacity([double opacity = 1]) => Opacity(opacity: opacity, child: this);

  Widget visible([bool visible = true]) => Visibility(visible: visible, child: this);

  Widget align([Alignment alignment = Alignment.centerLeft]) => Align(alignment: alignment, child: this);

  Widget onClick(void Function()? onClick) => GestureDetector(onTap: onClick, child: this);

  Widget scrollable([Axis direction = Axis.vertical]) => SingleChildScrollView(scrollDirection: direction, child: this);

  Widget paddingLTRB({double l = 0, double t = 0, double r = 0, double b = 0}) =>
      Padding(padding: EdgeInsets.only(left: l, top: t, right: r, bottom: b), child: this);

  Widget paddingY([double y = Gap.regular]) => paddingLTRB(t: y, b: y);

  Widget paddingX([double x = Gap.regular]) => paddingLTRB(l: x, r: x);

  Widget paddingXY([double x = Gap.regular, double y = Gap.regular]) => paddingLTRB(l: x, t: y, r: x, b: y);

  Widget paddingLeft([double n = Gap.regular]) => paddingLTRB(l: n);

  Widget paddingRight([double n = Gap.regular]) => paddingLTRB(r: n);

  Widget paddingTop([double n = Gap.regular]) => paddingLTRB(t: n);

  Widget paddingBottom([double n = Gap.regular]) => paddingLTRB(b: n);
}
