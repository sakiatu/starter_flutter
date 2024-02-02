import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/button.dart';
import '../../component/gap_xy.dart';
import '../../component/loader.dart';
import '../../helper/extension/ext_context.dart';
import '../../helper/extension/ext_widget.dart';

import '../theme/controller_theme.dart';

class HomePage extends GetView<ThemeController> {
  final l = false.obs;

  List<Widget> actions(BuildContext context) =>
      [IconButton(icon: const Icon(Icons.light_mode), onPressed: controller.toggleTheme)];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Home'), actions: actions(context)),
      body: ListView(children: [
        Row(children: [
          _loader(),
          _loaderDanger(),
          _customLoader(),
        ]),
        const GapY(),
        _button(context),
        _buttonDanger(context),
      ]).paddingXY());

  Widget _loader() => const Loader().paddingRight();

  Widget _customLoader() => const Loader(size: 24, stroke: 2.5).paddingRight();

  Widget _loaderDanger() => const Loader(danger: true).paddingRight();

  Widget _button(BuildContext context) =>
      MyButton(title: 'My Button', onClick: () => context.showSuccess('Clicked!')).paddingBottom();

  Widget _buttonDanger(BuildContext context) =>
      MyButton.danger(title: 'My Danger Button', onClick: () => context.showError('Clicked!')).paddingBottom();
}
