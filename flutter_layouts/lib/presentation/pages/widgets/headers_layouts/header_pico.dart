import 'package:flutter/material.dart';

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff515AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = const Color(0xff515AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.strokeWidth = 20;
    lapiz.style = PaintingStyle.fill;

    final path = Path();
    // MI IMPLEMENTACION
    // path.lineTo(0, 0);
    // path.lineTo(size.width, 0);

    // path.lineTo(0, 0);
    // path.lineTo(0, size.height * .4);
    // path.lineTo(size.height * .2, size.height * .6);

    // path.lineTo(size.height * .6, size.height * .3);
    // path.lineTo(size.height, 0);

    // IMPLEMENTACION DE FERNANDO
    path.lineTo(0, size.height * .25);
    path.lineTo(size.width * 0.5, size.height * .30);
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
