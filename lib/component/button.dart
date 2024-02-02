import 'package:flutter/material.dart';

import '../helper/extension/ext_context.dart';
import 'loader.dart';

enum _ButtonType { normal, danger }

class MyButton extends FilledButton {
  final _ButtonType _type;

  MyButton({
    super.key,
    required String title,
    required VoidCallback? onClick,
    bool loading = false,
  })  : _type = _ButtonType.normal,
        super(child: loading ? _loader() : Text(title), onPressed: loading ? null : onClick);

  MyButton.danger({
    super.key,
    required String title,
    required VoidCallback? onClick,
    bool loading = false,
  })  : _type = _ButtonType.danger,
        super(child: loading ? _loader(true) : Text(title), onPressed: loading ? null : onClick);

  static Widget _loader([bool danger = false]) => Loader(size: 24, stroke: 2.5, danger: danger);

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final style =
        super.defaultStyleOf(context).copyWith(minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)));
    return switch (_type) {
      _ButtonType.normal => style,
      _ButtonType.danger => style.copyWith(backgroundColor: MaterialStateProperty.resolveWith((states) {
          return context.colors.error.withOpacity(states.contains(MaterialState.disabled) ? 0.12 : 1.00);
        }))
    };
  }
}
