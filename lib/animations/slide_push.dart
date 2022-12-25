import 'package:flutter/material.dart';

class SlidePush extends PageRouteBuilder {
  final Widget widget;
  final AxisDirection direction;

  SlidePush({required this.widget, required this.direction})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        Offset getOffset(AxisDirection dir) {
          switch(dir) {
            case AxisDirection.up:
              return const Offset(0, 1);
            case AxisDirection.right:
              return const Offset(-1, 0);
            case AxisDirection.down:
              return const Offset(0, -1);
            case AxisDirection.left:
              return const Offset(1, 0);
          }
        }
        return SlideTransition(
          position: Tween<Offset>(
            begin: getOffset(direction),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
       // transitionDuration:Duration(seconds: 1);
      }
  );
}