import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color color;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  const RadialProgress(
      {super.key,
      required this.porcentaje,
      this.color = Colors.blueAccent,
      this.colorSecundario = Colors.deepPurple,
      this.grosorSecundario = 4,
      this.grosorPrimario = 10});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    super.initState();

    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final double diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              // painter: _RadialProgress(widget.porcentaje),
              painter: _RadialProgress(
                  porcentaje: (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller.value),
                  colorPrimario: widget.color,
                  colorSecundario: widget.colorSecundario,
                  grosorSecundario: widget.grosorSecundario,
                  grosorPrimario: widget.grosorPrimario),
            ),
          );
        });
  }
}

class _RadialProgress extends CustomPainter {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  // IMPLEMENTANDO GRADIENTE
  final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

  final Gradient gradiente = const LinearGradient(colors: [
    Color(0xffC012FF),
    Color(0xff6D05e8),
    Colors.indigoAccent,
  ]);

  _RadialProgress({
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.grosorSecundario,
    required this.grosorPrimario,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height / 2);

    final radio = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radio, paint);

    // arco pincel del arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      // ..color = colorPrimario
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

// dibujando el arco
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
