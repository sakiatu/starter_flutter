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
  })  : _type = _ButtonType.normal,
        super(child: loading ? _loader() : _foreground(title, icon), onPressed: loading ? null : onClick);

  MyButton.tonal({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
  })  : _type = _ButtonType.tonal,
        super.tonal(child: loading ? _loader() : _foreground(title, icon), onPressed: loading ? null : onClick);

  MyButton.text({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
  })  : _type = _ButtonType.text,
        super.tonal(child: loading ? _loader() : _foreground(title, icon), onPressed: loading ? null : onClick);

  MyButton.danger({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
  })  : _type = _ButtonType.danger,
        super(child: loading ? _loader(true) : _foreground(title, icon), onPressed: loading ? null : onClick);

  MyButton.dangerTonal({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
  })  : _type = _ButtonType.dangerTonal,
        super.tonal(child: loading ? _loader(true) : _foreground(title, icon), onPressed: loading ? null : onClick);

  MyButton.dangerText({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
  })  : _type = _ButtonType.dangerText,
        super.tonal(child: loading ? _loader(true) : _foreground(title, icon), onPressed: loading ? null : onClick);

  static Widget _loader([bool danger = false]) => Loader(size: 24, stroke: 2.5, danger: danger);

  static Widget _foreground(String text, IconData? icon) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [if (icon != null) Icon(icon).paddingRight(), Text(text)]);

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final style =
        super.defaultStyleOf(context).copyWith(minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)));
    return switch (_type) {
      _ButtonType.normal || _ButtonType.tonal => style,
      _ButtonType.text => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => context.colors.primary.withOpacity(states.contains(MaterialState.disabled) ? 0.38 : 1.00)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      _ButtonType.danger => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => context.colors.onError.withOpacity(states.contains(MaterialState.disabled) ? 0.38 : 1.00)),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => context.colors.error.withOpacity(states.contains(MaterialState.disabled) ? 0.12 : 1.00))),
      _ButtonType.dangerTonal => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith((states) =>
              context.colors.onErrorContainer.withOpacity(states.contains(MaterialState.disabled) ? 0.38 : 1.00)),
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              context.colors.errorContainer.withOpacity(states.contains(MaterialState.disabled) ? 0.12 : 1.00))),
      _ButtonType.dangerText => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => context.colors.error.withOpacity(states.contains(MaterialState.disabled) ? 0.38 : 1.00)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
    };
  }
}
