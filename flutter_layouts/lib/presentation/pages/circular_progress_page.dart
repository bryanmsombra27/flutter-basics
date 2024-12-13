import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  static const name = "circular_progress_page";

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    controller.addListener(() {
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;

          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.ac_unit_outlined),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final double porcentaje;

  _RadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height / 2);

    final radio = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radio, paint);

    // arco pincel del arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
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
