import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/component/card.dart';
import 'package:starter/component/circular_image.dart';
import 'package:starter/component/text.dart';
import 'package:starter/component/text_field.dart';
import 'package:starter/const/image.dart';

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
        const GapY(),
        Image.asset(MyImage.logo, width: 100, height: 100).paddingY(),
        Image.asset(MyImage.update, height: context.height*.4).paddingY(),
        Image.asset(MyImage.maintenance, height: context.height*.4).paddingY(),
        _button(context),
        _buttonDanger(context),
        _buttonTonal(context),
        _buttonDangerTonal(context),
        _buttonText(context),
        _buttonDangerText(context),
        _textField(context),
        _card(),
        _circularImage(),
        const GapY()
      ]).paddingX());

  Widget _loader() => const Loader().paddingRight();

  Widget _customLoader() => const Loader(size: 24, stroke: 2.5).paddingRight();

  Widget _loaderDanger() => const Loader(danger: true).paddingRight();

  Widget _button(BuildContext context) =>
      MyButton(title: 'My Button', onClick: () => context.showSuccess('Clicked!')).paddingBottom();

  Widget _buttonDanger(BuildContext context) =>
      MyButton.danger(title: 'My Danger Button', onClick: () => context.showError('Clicked!')).paddingBottom();

  Widget _buttonTonal(BuildContext context) =>
      MyButton.tonal(title: 'My Tonal Button', onClick: () => context.showSuccess('Clicked!')).paddingBottom();

  Widget _buttonDangerTonal(BuildContext context) =>
      MyButton.dangerTonal(title: 'My Danger Tonal Button', onClick: () => context.showError('Clicked!'))
          .paddingBottom();

  Widget _buttonText(BuildContext context) =>
      MyButton.text(title: 'My Text Button', onClick: () => context.showSuccess('Clicked!')).paddingBottom();

  Widget _buttonDangerText(BuildContext context) =>
      MyButton.dangerText(title: 'My Text Button', onClick: () => context.showError('Clicked!')).paddingBottom();

  Widget _textField(BuildContext context) =>
      MyTextField(hint: "hint text", label: "label text",disabled: true, icon: Icons.podcasts, minLines: 1, maxLines: 10)
          .paddingBottom();

  Widget _card() => MyCard(
          child: const MyText(
              'Card 1Card 1Card 1Card 1Card 1Card 1Card 1Card ----- 1Card 1Card- 1Card 1Card 1Card 1Card 1Card 1Card 1'))
      .paddingBottom();

  Widget _circularImage() => const CircularImage(
        image: 'https://avatars.githubusercontent.com/u/56442940?v=4',
        radius: 146,
        preview: true,
      ).paddingY().paddingBottom();
}
