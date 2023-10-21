import 'package:flutter/cupertino.dart';
import 'package:online_store/layouts/layouts.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class SliderRout extends PageRouteBuilder {
  final page;
  SliderRout({this.page})
      : super(
            pageBuilder: (context, animation, animationtow) => page,
            transitionsBuilder: (context, animation, animationtow, child) {
              var begin = 0.5;
              var end = 1.0;
              var tween = Tween(begin: begin, end: end);
              var offsetTween = animation.drive(tween);
              var curveanimation =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return RotationTransition(
                turns: tween.animate(curveanimation),
                child: child,
              );
              /*return Align(
                // alignment: Alignment.center,
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              );*/

              /*  return FadeTransition(
                opacity: animation,
                child: child,
              );*/
            });
}
