import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> autenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Autenticate para poder continuar',
          options: const AuthenticationOptions(
              // biometricOnly: true

              ));

      return (
        didAuthenticate,
        didAuthenticate ? "Desbloqueado" : "Cancelado por el usuario"
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Add handling of no hardware here.
        return (false, "biometricos no disponibles");
      } else if (e.code == auth_error.notEnrolled) {
        return (false, "No hay biometricos enrolados");
      } else if (e.code == auth_error.lockedOut) {
        return (false, "Muchos intentos fallidos");
      } else if (e.code == auth_error.passcodeNotSet) {
        return (false, "No hay pin configurado");
      } else if (e.code == auth_error.permanentlyLockedOut) {
        return (false, "Se requiere desbloquear el telefono de nuevo");
      }
      return (false, e.toString());
    }
  }

  static availableBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }
}
