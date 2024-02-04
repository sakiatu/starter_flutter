import 'package:flutter/material.dart';

import '../helper/extension/ext_context.dart';
import '../helper/extension/ext_widget.dart';
import 'loader.dart';

enum _ButtonType { normal, tonal, text, danger, dangerTonal, dangerText }

class MyButton extends FilledButton {
  final _ButtonType _type;

  MyButton({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.normal,
        super(child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.tonal({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.tonal,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.text({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.text,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.danger({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.danger,
        super(
            child: loading ? _loader(true) : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.dangerTonal({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.dangerTonal,
        super.tonal(
            child: loading ? _loader(true) : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.dangerText({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.dangerText,
        super.tonal(
            child: loading ? _loader(true) : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  static Widget _loader([bool danger = false]) => Loader(size: 24, stroke: 2.5, danger: danger);

  static Widget _foreground(String text, IconData? icon) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [if (icon != null) Icon(icon).paddingRight(), Text(text)]);

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final style =
        super.defaultStyleOf(context).copyWith(minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)));
    final disableForeground = context.colors.onSurface.withOpacity(0.38);
    final disableBackground = context.colors.onSurface.withOpacity(0.12);

    return switch (_type) {
      _ButtonType.normal || _ButtonType.tonal => style,
      _ButtonType.text => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : context.colors.primary),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      _ButtonType.danger => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : context.colors.onError),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableBackground : context.colors.error)),
      _ButtonType.dangerTonal => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.disabled) ? disableForeground : context.colors.onErrorContainer),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableBackground : context.colors.errorContainer)),
      _ButtonType.dangerText => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : context.colors.error),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
    };
  }
}
