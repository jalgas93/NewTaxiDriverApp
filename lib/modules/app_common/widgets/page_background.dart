import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  final Widget child;

  const PageBackground({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xff4d8df1),
            Color(0xff002f9b),
          ],
          center: Alignment.topLeft,
          radius: 2.0,
        ),
        /*gradient: LinearGradient(
          colors: [
            Color(0xff4d8df1),
            Color(0xff002f9b),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),*/
        color: Color(0xff2960c7),
      ),
      child: child,
    );
  }
}
