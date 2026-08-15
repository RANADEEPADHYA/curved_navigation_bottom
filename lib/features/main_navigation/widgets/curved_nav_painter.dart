import 'package:flutter/material.dart';

class CurvedNavPainter extends CustomPainter {
  final double x;

  CurvedNavPainter(this.x);

  final double start = 40.0;
  final double end = 120.0;

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final Path path = Path();

    path.moveTo(
      0.0,
      start,
    );

    // Drop paths - x is used for animation.
    path.lineTo(
      x < 20.0 ? 20.0 : x,
      start,
    );

    path.quadraticBezierTo(
      20.0 + x,
      start,
      30.0 + x,
      start + 30.0,
    );

    path.quadraticBezierTo(
      40.0 + x,
      start + 55.0,
      70.0 + x,
      start + 55.0,
    );

    path.quadraticBezierTo(
      100.0 + x,
      start + 55.0,
      110.0 + x,
      start + 30.0,
    );

    path.quadraticBezierTo(
      120.0 + x,
      start,
      (140.0 + x) > (size.width - 20.0)
          ? size.width - 20.0
          : 140.0 + x,
      start,
    );

    path.lineTo(
      size.width - 20.0,
      start,
    );

    // Rounded outer box.
    path.quadraticBezierTo(
      size.width,
      start,
      size.width,
      start + 25.0,
    );

    path.lineTo(
      size.width,
      end - 25.0,
    );

    path.quadraticBezierTo(
      size.width,
      end,
      size.width - 25.0,
      end,
    );

    path.lineTo(
      25.0,
      end,
    );

    path.quadraticBezierTo(
      0.0,
      end,
      0.0,
      end - 25.0,
    );

    path.lineTo(
      0.0,
      start + 25.0,
    );

    path.quadraticBezierTo(
      0.0,
      start,
      20.0,
      start,
    );

    path.close();

    canvas.drawPath(
      path,
      paint,
    );

    canvas.drawCircle(
      Offset(
        70 + x,
        50.0,
      ),
      35.0,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant CurvedNavPainter oldDelegate,
      ) {
    return oldDelegate.x != x;
  }
}