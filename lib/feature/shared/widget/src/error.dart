import 'package:flutter/material.dart';
import '../../../../core/const/icon.dart';
import '../../../../core/const/image.dart';
import '../../../../core/const/string.dart';
import '../../../../core/extension/widget.dart';

import '../../../../core/extension/context.dart';
import 'button.dart';

class ErrorWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Function()? action;

  const ErrorWidget({this.title, this.subtitle, this.icon, this.action, super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: context.colors.onSurface.withOpacity(0.1),
              radius: 60,
              child: Icon(icon ?? MyIcon.error, size: 72, color: context.colors.onSurface.withOpacity(0.7))),
          Text(title ?? MyString.errorTitle, style: context.styles.titleLarge).paddingTop(24),
          Text(subtitle ?? MyString.errorSomethingWentWrong, style: context.styles.bodyMedium),
          if (action != null) MyButton.text(title: 'Try Again', onClick: action).paddingXY(),
          Image.asset(MyImage.logo, width: 100, height: 100, fit: BoxFit.contain)
        ],
      );
}

class ErrorPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Function()? action;

  const ErrorPage({this.title, this.subtitle, this.icon, this.action, super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: ErrorWidget(title: title, subtitle: subtitle, icon: icon, action: action));
}
