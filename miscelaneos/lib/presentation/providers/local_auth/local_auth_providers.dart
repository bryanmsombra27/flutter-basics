// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:miscelaneos/config/config.dart';

enum LocalAuthStatus { authenticated, notAthenticated, authenticating }

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

class LocalAuthState {
  final bool authenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState(
      {this.authenticate = false,
      this.status = LocalAuthStatus.notAthenticated,
      this.message = ""});

  LocalAuthState copyWith({
    bool? authenticate,
    LocalAuthStatus? status,
    String? message,
  }) {
    return LocalAuthState(
        authenticate: authenticate ?? this.authenticate,
        message: message ?? this.message,
        status: status ?? this.status);
  }

  @override
  String toString() =>
      'LocalAuthState(authenticate: $authenticate, status: $status, message: $message)';
}

class LocalAuthNotifier extends StateNotifier<LocalAuthState> {
  LocalAuthNotifier() : super(LocalAuthState());

  Future<(bool, String)> authenticatedUser() async {
    final (didAuthenticate, message) = await LocalAuthPlugin.autenticate();

    state = state.copyWith(
        authenticate: didAuthenticate,
        message: message,
        status: didAuthenticate
            ? LocalAuthStatus.authenticated
            : LocalAuthStatus.notAthenticated);

    return (didAuthenticate, message);
  }
}

final localAuthProvider =
    StateNotifierProvider<LocalAuthNotifier, LocalAuthState>((ref) {
  return LocalAuthNotifier();
});
