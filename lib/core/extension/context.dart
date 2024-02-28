import 'package:flutter/material.dart';

import '../const/color.dart';

extension ContextBasic on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get styles => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;

  CustomColors get customColors => theme.extension<CustomColors>()!;

  bool get dark => theme.brightness == Brightness.dark;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}

extension ContextSnackBar on BuildContext {
  void hideSnackBar() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void showSuccess(String msg) => showSnackBar(msg, colors.onPrimary, colors.primary);

  void showError(String msg) => showSnackBar(msg, colors.onError, colors.error);

  void showSnackBar(String msg, Color text, Color bg) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(msg, style: styles.labelLarge?.copyWith(color: text)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: bg,
      duration: const Duration(milliseconds: 2000)));
}

extension ContextNavigation on BuildContext {
  void back() => Navigator.of(this).pop();

  void to(Widget page) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  void toReplace(Widget page) => Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));

  void toRemoveUntil(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false);
}
