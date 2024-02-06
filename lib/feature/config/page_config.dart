import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/const/image.dart';
import 'package:starter/feature/config/controller_config.dart';
import 'package:starter/helper/extension/ext_context.dart';
import 'package:starter/helper/extension/ext_widget.dart';

class ConfigPage extends GetView<ConfigController> {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: context.colors.surface,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(MyImage.logo, width: context.height * .2, height: context.height * .2).center()]));
}
