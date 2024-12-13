import 'package:flutter/material.dart';

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff515AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = const Color(0xff515AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.strokeWidth = 20;
    lapiz.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(
        size.width * .5, size.height * .40, size.width, size.height * .25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
