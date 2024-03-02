import 'package:flutter/material.dart';

import '../../../../core/const/image.dart';
import '../../../../core/const/string.dart';
import '../../../../core/extension/context.dart';
import '../../../../core/extension/widget.dart';
import '../../../shared/widget/basic.dart';

class UpdateView extends StatelessWidget {
  final Function()? onUpdateButtonClick;

  const UpdateView({this.onUpdateButtonClick, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
      Image.asset(MyImage.logo, width: context.height * .15, height: context.height * .15),
      Image.asset(MyImage.update, width: context.height * .4, height: context.height * .4),
      const MyText(MyString.updateApp, wrap: false, textAlign: TextAlign.center),
      _button(context),
    ]).paddingX());
  }

  Widget _button(BuildContext context) => MyButton(title: MyString.updateButton, onClick: onUpdateButtonClick).paddingY();
}
