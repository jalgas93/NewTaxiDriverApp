import 'package:flutter/material.dart';
import 'package:taxi_driver/helpers/app_colors.dart';


class BlockContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  final bool hasMargin;

  final EdgeInsets margin;
  final BoxConstraints constraints;
  final BoxDecoration decoration;
  final bool withClipRect;
  final EdgeInsets padding;

  const BlockContainer({
    Key key,
    this.width = double.infinity,
    this.child,
    this.height,
    this.constraints,
    this.margin = const EdgeInsets.only(top: 20.0),
    this.hasMargin = false,
    this.decoration = const BoxDecoration(),
    this.withClipRect = true,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      padding: padding,
      constraints: constraints,
      width: width,
      height: height,
      margin: !hasMargin ? EdgeInsets.zero : margin,
      decoration: decoration.copyWith(
        color: AppColors.blockBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: child,
    );

    if (withClipRect) {
      container = ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: container,
      );
    }

    return container;
  }
}
