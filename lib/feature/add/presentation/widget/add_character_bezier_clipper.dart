import 'package:flutter/material.dart';

class AddCharacterBezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(0 * _xScaling, -2 * _yScaling);
    path.cubicTo(
      203.073 * _xScaling,
      -2 * _yScaling,
      316.927 * _xScaling,
      -2 * _yScaling,
      520 * _xScaling,
      -2 * _yScaling,
    );
    path.cubicTo(
      520 * _xScaling,
      -2 * _yScaling,
      520 * _xScaling,
      171.517 * _yScaling,
      520 * _xScaling,
      400.982 * _yScaling,
    );
    path.cubicTo(
      520 * _xScaling,
      630.446 * _yScaling,
      0 * _xScaling,
      122.057 * _yScaling,
      0 * _xScaling,
      400.982 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      679.906 * _yScaling,
      0 * _xScaling,
      -2 * _yScaling,
      0 * _xScaling,
      -2 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      -2 * _yScaling,
      0 * _xScaling,
      -2 * _yScaling,
      0 * _xScaling,
      -2 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
