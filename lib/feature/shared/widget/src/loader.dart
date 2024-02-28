import 'package:flutter/material.dart';
import '../../../../core/extension/context.dart';

class Loader extends StatelessWidget {
  final double? size;
  final double stroke;
  final bool danger;

  const Loader({this.size, this.stroke = 4.0, this.danger = false}) : super(key: null);

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(strokeWidth: stroke, color: danger ? context.colors.error : null)),
      );
}


class LoaderPage extends StatelessWidget {
  final bool danger;

  const LoaderPage({this.danger = false}) : super(key: null);

  @override
  Widget build(BuildContext context) => Scaffold(body: Loader(danger: danger));
}
