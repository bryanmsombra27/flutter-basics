import 'package:flutter/material.dart';
import "dart:math" as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  static const name = "animaciones_page";

  @override
  Widget build(BuildContext context) {
    return Center(child: const CuadradoAnimado());
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> move;
  late Animation<double> scale;

  @override
  void initState() {
    // iniciar la animacion
    // controller.forward();

    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    opacity = Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        // EL INTERVAL TOMA EL TIEMPO QUE TOMARA ANIMAR EL ELEMENTO  YENDO DE 0 A 1 (0% A 100%) DONDE PODEMOS DEFINIR LA VELOCIDAD QUE TENDRA LA ANIMACION Y COMO 3ER PARAMETRO PODEMOS AGREGAR UN TIPO DE ANIMACION QUE TENDRA EL ELEMENTO
        curve: const Interval(0, .25, curve: Curves.easeInOut)));

    // opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
    //     parent: controller,
    //     // EL INTERVAL TOMA EL TIEMPO QUE TOMARA ANIMAR EL ELEMENTO  YENDO DE 0 A 1 (0% A 100%) DONDE PODEMOS DEFINIR LA VELOCIDAD QUE TENDRA LA ANIMACION Y COMO 3ER PARAMETRO PODEMOS AGREGAR UN TIPO DE ANIMACION QUE TENDRA EL ELEMENTO
    //     curve: const Interval(.75, 1, curve: Curves.easeOut)));

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        // EL INTERVAL TOMA EL TIEMPO QUE TOMARA ANIMAR EL ELEMENTO  YENDO DE 0 A 1 (0% A 100%) DONDE PODEMOS DEFINIR LA VELOCIDAD QUE TENDRA LA ANIMACION Y COMO 3ER PARAMETRO PODEMOS AGREGAR UN TIPO DE ANIMACION QUE TENDRA EL ELEMENTO
        curve: const Interval(.75, 1, curve: Curves.easeOut)));

    move = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));

    scale = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
        // controller.repeat();
      }
      //  else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // iniciar la animacion
    // controller.repeat();
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(move.value, 0),
          child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacity.value - opacityOut.value,
                child: Transform.scale(scale: scale.value, child: child),
              )),
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
