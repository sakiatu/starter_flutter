import 'package:flutter/material.dart';
import 'package:starter/core/extension/context.dart';
import 'package:starter/core/extension/widget.dart';

import '../../../../core/const/image.dart';
import '../../../../core/const/string.dart';
import '../../../shared/widget/basic.dart';

class MaintenanceView extends StatelessWidget {
  const MaintenanceView({super.key});

  @override
  Widget build(BuildContext context) => Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
    Image.asset(MyImage.logo, width: context.height * .15, height: context.height * .15),
    Image.asset(MyImage.maintenance, width: context.height * .4, height: context.height * .4),
    MyText(MyString.maintenanceMode, wrap: false,style: context.styles.titleLarge, textAlign: TextAlign.center),
  ]).paddingX();
}
