import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/component/text.dart';
import 'package:starter/const/image.dart';
import 'package:starter/const/string.dart';
import 'package:starter/feature/update/controller_update.dart';

import '../../component/button.dart';
import '../../component/gap_xy.dart';
import '../../helper/extension/ext_widget.dart';

class UpdatePage extends GetView<UpdateController> {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
        Image.asset(MyImage.logo, width: context.height * .15, height: context.height * .15),
        Image.asset(MyImage.update, width: context.height * .4, height: context.height * .4),
        const MyText(MyString.updateApp, wrap: false, textAlign: TextAlign.center),
        _button(context),
        const GapY()
      ]).paddingX());

  Widget _button(BuildContext context) => Obx(() =>
      MyButton(title: MyString.updateButton, loading: controller.loading.value, onClick: controller.onUpdateClick)
          .paddingY());
}
