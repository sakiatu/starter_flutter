import 'package:flutter/material.dart';
import '../../const/size.dart';

extension WidgetExtension on Widget {
  Widget center() => Center(child: this);

  Widget expand([int flex = 1]) => Expanded(flex: flex, child: this);

  Widget align([Alignment alignment = Alignment.centerLeft]) => Align(alignment: alignment, child: this);

  Widget onClick(Function()? onClick) => GestureDetector(onTap: onClick, child: this);

  Widget scrollable([Axis direction = Axis.vertical]) => SingleChildScrollView(scrollDirection: direction, child: this);

  Widget paddingLTRB({double l = 0, double t = 0, double r = 0, double b = 0}) =>
      Padding(padding: EdgeInsets.only(left: l, top: t, right: r, bottom: b), child: this);

  Widget padding([double n = Gap.regular]) => paddingLTRB(l:n,t: n,r: n,b: n);

  Widget paddingVertical([double v = 0]) => paddingLTRB(t: v, b: v);

  Widget paddingHorizontal([double h = 0]) => paddingLTRB(l: h, r: h);

  Widget paddingVH(double v, double h) => paddingLTRB(l: h, t: v, r: h, b: v);

  Widget paddingLeft([double n = Gap.regular]) => paddingLTRB(l: n);

  Widget paddingRight([double n = Gap.regular]) => paddingLTRB(r: n);

  Widget paddingTop([double n = Gap.regular]) => paddingLTRB(t: n);

  Widget paddingBottom([double n = Gap.regular]) => paddingLTRB(b: n);
}
