import 'package:flutter/material.dart';

class HeaderTriangle extends StatelessWidget {
  const HeaderTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff515AAB),
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = const Color(0xff515AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.strokeWidth = 20;
    lapiz.style = PaintingStyle.fill;

    final path = Path();

// TRIANGULO EN LA PARTE SUPERIOR
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // TRIANGULO PARTE INFERIOR
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
