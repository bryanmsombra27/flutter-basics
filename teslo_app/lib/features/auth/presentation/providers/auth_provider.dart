import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(authRepository: authRepository);
});

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ""});

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.login(email, password);

      _setLoggedUser(user);
    } on WrongCredentials {
      logout('crdenciales no son correctas');
    } catch (e) {
      logout('erorr no controaldo');
    }
  }

  void registerUser(String email, String password) async {}

  void checkAuthStatus() async {}

  Future<void> logout(String? errorMessage) async {
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  void _setLoggedUser(User user) {
    state = state.copyWith(
        user: user, errorMessage: '', authStatus: AuthStatus.authenticated);
  }
}
