import 'package:flutter/material.dart';

import '../../const/theme.dart';

extension ContextExtension on BuildContext {
  TextTheme get styles => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;

  CustomColors get customColors => Theme.of(this).extension<CustomColors>()!;

  bool get dark => Theme.of(this).brightness == Brightness.dark;

  void hideSnackBar() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void showSuccess(String msg) => showSnackBar(msg, colors.onPrimary, colors.primary);

  void showError(String msg) => showSnackBar(msg, colors.onError, colors.error);

  void showSnackBar(String msg, Color text, Color bg) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(msg, style: styles.labelLarge?.copyWith(color: text)),
      backgroundColor: bg,
      duration: const Duration(milliseconds: 2000)));

  void back() => Navigator.of(this).pop();

  void to(Widget page) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  void toReplace(Widget page) => Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));

  void toRemoveUntil(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false);
}
