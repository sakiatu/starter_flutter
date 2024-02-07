import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/component/text.dart';
import 'package:starter/const/image.dart';
import 'package:starter/const/string.dart';
import 'package:starter/feature/maintenance/controller_maintenance.dart';
import 'package:starter/helper/extension/ext_context.dart';

import '../../component/gap_xy.dart';
import '../../helper/extension/ext_widget.dart';

class MaintenancePage extends GetView<MaintenanceController> {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
        Image.asset(MyImage.logo, width: context.height * .15, height: context.height * .15),
        Image.asset(MyImage.maintenance, width: context.height * .4, height: context.height * .4),
        MyText(MyString.maintenanceMode, wrap: false,style: context.styles.titleLarge, textAlign: TextAlign.center),
        const GapY()
      ]).paddingX());
}
