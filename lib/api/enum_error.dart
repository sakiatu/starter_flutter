import 'package:flutter/material.dart';
import 'package:starter/const/icon.dart';
import 'package:starter/const/string.dart';

enum ErrorType {
  network(MyString.errorNetworkTitle, MyString.errorNetwork, MyIcon.wifiOff),
  cache(MyString.errorCacheTitle, MyString.errorCache, MyIcon.error),
  somethingWentWrong(MyString.errorTitle, MyString.error, MyIcon.error);

  const ErrorType(this.title, this.message, this.icon);

  final String title;
  final String message;
  final IconData icon;
}
