import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GiroscopeBallScreen extends ConsumerWidget {
  const GiroscopeBallScreen({super.key});

  static const name = "giroscope_ball_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acelerometro'),
      ),
      body: SizedBox.expand(
        child: gyroscope.when(
            data: (value) => MovingBall(
                  x: value.x,
                  y: value.y,
                ),
            error: (error, stacktrace) => Text('$error'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  final double x;
  final double y;

  const MovingBall({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;

    double currentYpos = y * 100;
    double currentXpos = x * 100;

    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          '''
  X:$x,
  Y:$y
''',
          style: const TextStyle(fontSize: 30),
        ),
        AnimatedPositioned(
            left: (currentYpos - 25) + (screenWidth / 2),
            top: (currentXpos - 25) + (screenHeight / 2),
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            child: const Ball())
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
    );
  }
}
