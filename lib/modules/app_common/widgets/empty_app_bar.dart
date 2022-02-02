import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final overlayStyle = Theme.of(context).appBarTheme.systemOverlayStyle;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Container(),
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
