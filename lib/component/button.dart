import 'package:flutter/material.dart';

import '../helper/extension/ext_context.dart';

enum _ButtonType { normal, danger }

class MyButton extends FilledButton {
  final _ButtonType _type;

  MyButton({
    super.key,
    required VoidCallback? onClick,
    required String title,
    bool loading = false,
  })  : _type = _ButtonType.normal,
        super(child: loading ? _loader() : Text(title), onPressed: loading ? null : onClick);

  MyButton.danger({super.key, required VoidCallback? onClick, required String title, bool loading = false})
      : _type = _ButtonType.danger,
        super(child: loading ? _loader() : Text(title), onPressed: loading ? null : onClick);

  static Widget _loader() => const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2));

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
