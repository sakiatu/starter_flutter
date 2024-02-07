import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/api/enum_error.dart';
import 'package:starter/component/gap_xy.dart';
import 'package:starter/const/image.dart';
import 'package:starter/helper/extension/ext_widget.dart';

import '../helper/extension/ext_context.dart';
import 'button.dart';

class ErrorWidget extends StatelessWidget {
  final ErrorType error;
  final Function()? action;

  const ErrorWidget(this.error, {this.action}) : super(key: null);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: context.colors.onSurface.withOpacity(0.1),
              radius: 60,
              child: Icon(error.icon, size: 72, color: context.colors.onSurface.withOpacity(0.7))),
          Text(error.title, style: context.styles.titleLarge).paddingTop(24),
          Text(error.message, style: context.styles.bodyMedium),
          if (action != null) MyButton.text(title: 'Try Again', onClick: action).paddingXY(),
          Image.asset(MyImage.logo, width: 100, height: 100, fit: BoxFit.contain)
        ],
      );
}

class ErrorPage extends StatelessWidget {
  final ErrorType error;
  final Function()? action;

  const ErrorPage(this.error, {this.action}) : super(key: null);

  @override
  Widget build(BuildContext context) => Scaffold(body: ErrorWidget(error, action: action));
}
