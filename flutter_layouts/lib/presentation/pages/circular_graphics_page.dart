import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/pages/widgets/shared/radial_progress.dart';

class CircularGraphicsPage extends StatefulWidget {
  const CircularGraphicsPage({super.key});

  static const name = "circular_graphics_page";

  @override
  State<CircularGraphicsPage> createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double porcentaje = 10.0;

  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).colorScheme.primary;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            porcentaje += 10;

            if (porcentaje > 100) {
              porcentaje = 0;
            }
            setState(() {});
          },
          child: const Icon(Icons.access_time_rounded),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustormRadialProgress(
                  colorPrimary: Colors.yellow,
                  porcentaje: porcentaje,
                ),
                CustormRadialProgress(
                  colorPrimary: Colors.pink,
                  porcentaje: porcentaje,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustormRadialProgress(
                  colorPrimary: colorPrimary,
                  porcentaje: porcentaje,
                ),
                CustormRadialProgress(
                  colorPrimary: Colors.red,
                  porcentaje: porcentaje,
                ),
              ],
            ),
          ],
        ));
  }
}

class CustormRadialProgress extends StatelessWidget {
  const CustormRadialProgress({
    super.key,
    this.colorPrimary = Colors.cyan,
    required this.porcentaje,
  });

  final Color colorPrimary;
  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // mandar a llamar este widget que tiene toda la configuracion del  la barra de progreso
      child: RadialProgress(
        porcentaje: porcentaje,
        color: colorPrimary,
      ),
    );
  }
}
