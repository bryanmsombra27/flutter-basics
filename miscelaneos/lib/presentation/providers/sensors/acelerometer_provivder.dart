import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

final accelerometerGravityProvider =
    StreamProvider.autoDispose<AccelerometerXYZ>((ref) async* {
  // CUANDO EL DISPOSITIVO SE ENCUENTRA GIRANDO
  await for (final event in accelerometerEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));

    yield AccelerometerXYZ(x: x, y: y, z: z);
  }
});

final accelerometerWithoutGravityProvider =
    StreamProvider.autoDispose<AccelerometerXYZ>((ref) async* {
  // CUANDO EL DISPOSITIVO SE ENCUENTRA GIRANDO
  await for (final event in userAccelerometerEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));

    yield AccelerometerXYZ(x: x, y: y, z: z);
  }
});

class AccelerometerXYZ {
  final double x;
  final double y;
  final double z;

  AccelerometerXYZ({required this.x, required this.y, required this.z});

  @override
  String toString() {
    return '''
    x: $x,
    y: $y,
    z:$z
''';
  }
}
