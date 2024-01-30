import 'package:flutter/material.dart';

import '../../const/theme.dart';

extension ContextExtension on BuildContext {
  TextTheme get styles => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;

  CustomColors get customColors => Theme.of(this).extension<CustomColors>()!;

  bool get dark => Theme.of(this).brightness == Brightness.dark;

  void hideSnackBar() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void showSuccess(String msg) => showSnackBar(msg, Colors.green);

  void showError(String msg) => showSnackBar(msg, Colors.red);

  void showSnackBar(String msg, Color color) => ScaffoldMessenger.of(this)
      .showSnackBar(SnackBar(content: Text(msg), backgroundColor: color, duration: const Duration(milliseconds: 2000)));

  void back() => Navigator.of(this).pop();

  void to(Widget page) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  void toReplace(Widget page) => Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));

  void toRemoveUntil(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false);
}
