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
  List<Widget> actions(BuildContext context) => [
        IconButton(
            icon: context.dark ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
            onPressed: controller.toggleTheme)
      ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Home'), actions: actions(context)),
      body: ListView(children: [
        const GapY(),
        Image.asset(MyImage.logo, width: 100, height: 100).paddingY(),
        Row(children: [_button(context).expand(), const GapX(), _buttonDanger(context).expand()]).paddingBottom(),
        Row(children: [_buttonDangerTonal(context).expand(), const GapX(), _buttonTonal(context).expand()])
            .paddingBottom(),
        Row(children: [_buttonText(context).expand(), const GapX(), _buttonDangerText(context).expand()])
            .paddingBottom(),
        _textField(context),
        _card(),
        _circularImage(),
        const GapY()
      ]).paddingX());

  Widget _loader() => const Loader().paddingRight();

  Widget _customLoader() => const Loader(size: 24, stroke: 2.5).paddingRight();

  Widget _loaderDanger() => const Loader(danger: true).paddingRight();

  Widget _button(BuildContext context) =>
      MyButton.outlined(title: 'My Button', disabled: false, onClick: () => context.showSuccess('Clicked!'));

  Widget _buttonDanger(BuildContext context) =>
      MyButton.danger(title: 'My Danger Button', onClick: () => context.showError('Clicked!'));

  Widget _buttonTonal(BuildContext context) =>
      MyButton.tonal(title: 'My Tonal Button', onClick: () => context.showSuccess('Clicked!'));

  Widget _buttonDangerTonal(BuildContext context) =>
      MyButton.dangerTonal(title: 'Danger Tonal Button', onClick: () => context.showError('Clicked!'));

  Widget _buttonText(BuildContext context) =>
      MyButton.text(title: 'My Text Button', onClick: () => context.showSuccess('Clicked!'));

  Widget _buttonDangerText(BuildContext context) =>
      MyButton.dangerText(title: 'My Text Button', onClick: () => context.showError('Clicked!'));

  Widget _textField(BuildContext context) => MyTextField(
          hint: "hint text", label: "label text", disabled: true, icon: Icons.podcasts, minLines: 1, maxLines: 10)
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
