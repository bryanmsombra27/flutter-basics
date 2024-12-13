import 'package:flutter/material.dart';

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff515AAB),
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 180);
    const Gradient gradiente = LinearGradient(
        colors: <Color>[
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.5, 1.0]);
    final lapiz = Paint()..shader = gradiente.createShader(rect);

    lapiz.color = const Color(0xff515AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.strokeWidth = 20;
    lapiz.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * .25);

    path.quadraticBezierTo(size.width * .25, size.height * .30, size.width * .5,
        size.height * .25);

    path.quadraticBezierTo(
        size.width * .75, size.height * .20, size.width, size.height * .25);

    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
