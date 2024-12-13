import 'package:flutter/material.dart';

class CuadradoAnimadoReto extends StatefulWidget {
  const CuadradoAnimadoReto({super.key});

  static const name = "cuadrado_animado";

  @override
  State<CuadradoAnimadoReto> createState() => _CuadradoAnimadoRetoState();
}

class _CuadradoAnimadoRetoState extends State<CuadradoAnimadoReto>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moveRight;
  late Animation<double> moveLeft;
  late Animation<double> moveUp;
  late Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, .25, curve: Curves.bounceOut)));
    moveUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(.25, .50, curve: Curves.bounceOut)));
    moveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(.50, .75, curve: Curves.bounceOut)));
    moveDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(
              moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
