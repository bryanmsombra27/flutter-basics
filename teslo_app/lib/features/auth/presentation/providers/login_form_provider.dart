import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/shared/shared.dart';

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;

  return LoginFormNotifier(loginUserCallback: loginUserCallback);
});

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  @override
  String toString() {
    return '''
    LoginFormState:
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      email: $email
      password: $password

''';
  }

  LoginFormState copyWith(
      {bool? isPosting,
      bool? isFormPosted,
      bool? isValid,
      Email? email,
      Password? password}) {
    return LoginFormState(
        email: email ?? this.email,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        isValid: isValid ?? this.isValid,
        password: password ?? this.password);
  }
}

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final Function(String, String) loginUserCallback;

  LoginFormNotifier({required this.loginUserCallback})
      : super(LoginFormState());

  onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
    );
  }

  onPasswordChange(String value) {
    final password = Password.dirty(value);

    state = state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.email]),
    );
  }

  onFormSubmit() async {
    _touchedEveryField();
    if (!state.isValid) return;

    await loginUserCallback(state.email.value, state.password.value);
  }

  _touchedEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]));
  }
}
