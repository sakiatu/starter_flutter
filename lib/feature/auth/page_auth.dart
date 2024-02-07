import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/component/text.dart';
import 'package:starter/component/text_field.dart';
import 'package:starter/const/image.dart';
import 'package:starter/feature/auth/controller_auth.dart';

import '../../component/button.dart';
import '../../component/gap_xy.dart';
import '../../helper/extension/ext_context.dart';
import '../../helper/extension/ext_widget.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: ListView(children: [
        GapY(context.height * .1),
        Image.asset(MyImage.logo, width: context.height*.2, height:context.height*.2),
        MyTextField(hint: 'Phone',autofocus: true,keyboardType: TextInputType.phone),
        _button(context),
        const GapY()
      ]).paddingX());

  Widget _button(BuildContext context) =>
      MyButton(title: 'Continue', onClick: () => context.showSuccess('Clicked!')).paddingY();
}
