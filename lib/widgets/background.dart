import 'dart:math' as Math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninja_coffee/res/constant.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(0, size.height / 16);

    final paint = Paint()..color = primaryColor;
    canvas.drawRect(
        Rect.fromCenter(
            center: center, width: 2 * size.width, height: size.height / 4),
        paint);
    //top right arc
    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: size.width, height: size.height / 2),
        Math.pi / 6,
        Math.pi / 3,
        true,
        paint);
    final paint2 = Paint()..color = screenBackground;
    // top left arc to cut rect
    center = Offset(0.85 * size.width, 0.325 * size.height);
    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: size.width, height: size.height / 2),
        7 * Math.pi / 6,
        2 * Math.pi / 3,
        true,
        paint2);

    center = Offset(size.width / 2, 9 * size.height / 10);

    canvas.drawRect(
        Rect.fromCenter(
            center: center,
            width: 2 * size.width,
            height: 2 * size.height / 10),
        paint);

    center = Offset(0, 4 * size.height / 5);
    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: 2 * size.width, height: 1 * size.height / 7),
        0,
        0.68 * Math.pi,
        true,
        paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
