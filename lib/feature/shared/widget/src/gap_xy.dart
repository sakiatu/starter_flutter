import 'package:flutter/material.dart';

import '../../../../core/const/size.dart';

class GapXY extends SizedBox {
  const GapXY([double x = Gap.regular, double y = Gap.regular]) : super(width: x, height: y, key: null);
}

class GapX extends GapXY {
  const GapX([double x = Gap.regular]) : super(x, 0);
}

class GapY extends GapXY {
  const GapY([double y = Gap.regular]) : super(0, y);
}
