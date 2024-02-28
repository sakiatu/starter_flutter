import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../../core/extension/context.dart';

class Shimmer extends StatefulWidget {
  final Widget child;
  final Duration period = const Duration(milliseconds: 1500);

  const Shimmer({super.key, required this.child});

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) return;
        _controller.repeat();
      });
    _controller.forward();
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) => _Shimmer(
        percent: _controller.value,
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _Shimmer extends SingleChildRenderObjectWidget {
  final double percent;

  const _Shimmer({
    Widget? child,
    required this.percent,
  }) : super(child: child);

  Gradient _gradient(BuildContext context) =>
      LinearGradient(begin: Alignment.topLeft, end: Alignment.centerRight, colors: <Color>[
        context.colors.onSurface.withOpacity(.2),
        context.colors.onSurface.withOpacity(.2),
        context.colors.onSurface.withOpacity(.1),
        context.colors.onSurface.withOpacity(.2),
        context.colors.onSurface.withOpacity(.2)
      ], stops: const <double>[
        0.0,
        0.35,
        0.5,
        0.65,
        1.0
      ]);

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percent, _gradient(context));
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter shimmer) {
    shimmer.percent = percent;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  double _percent;
  final Gradient _gradient;

  _ShimmerFilter(this._percent, this._gradient);

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(double newValue) {
    if (newValue == _percent) return;

    _percent = newValue;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);

      final double width = child!.size.width;
      final double height = child!.size.height;
      Rect rect;
      double dx, dy;

      // The gradient moves from left to right
      dx = _offset(-width, width, _percent);
      dy = 0.0;
      rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);

      layer ??= ShaderMaskLayer();
      layer!
        ..shader = _gradient.createShader(rect)
        ..maskRect = offset & size
        ..blendMode = BlendMode.srcIn;
      context.pushLayer(layer!, super.paint, offset);
    } else {
      layer = null;
    }
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }
}
