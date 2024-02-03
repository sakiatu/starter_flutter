import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starter/const/icon.dart';

import '../helper/extension/ext_context.dart';

class CircularImage extends StatelessWidget {
  final String? image;
  final double radius;
  final double stroke;
  final Color? strokeColor;
  final BoxFit? fit;
  final IconData? placeholder;
  final bool preview;

  const CircularImage(
      {super.key,
      this.image,
      this.stroke = 2,
      this.strokeColor,
      this.radius = 24,
      this.fit = BoxFit.cover,
      this.placeholder,
      this.preview = false});

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          color: context.colors.surfaceVariant.withOpacity(0.38),
          border: Border.all(width: stroke, color: strokeColor ?? context.colors.outline),
          shape: BoxShape.circle),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () =>preview? showImage(context):false,
        child: ClipOval(
            child: image == null || '$image'.isEmpty
                ? _placeholder(context)
                : CachedNetworkImage(
                    imageUrl: image!,
                    height: radius * 2,
                    width: radius * 2,
                    fit: fit,
                    placeholder: (context, url) => _placeholder(context),
                    errorWidget: (context, url, error) => _placeholder(context),
                  )),
      ));

  Widget _placeholder(BuildContext context) => SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: Icon(placeholder ?? MyIcon.placeholder, size: radius * 1.5, color: context.colors.onSurfaceVariant));

  void showImage(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog.fullscreen(
                child: Scaffold(
              backgroundColor: context.colors.surfaceVariant,
              appBar: AppBar(backgroundColor: context.colors.surfaceVariant),
              body: Center(
                child: CachedNetworkImage(
                    imageUrl: image!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => _placeholder(context),
                    errorWidget: (context, url, error) => _placeholder(context)),
              ),
            )));
  }
}
