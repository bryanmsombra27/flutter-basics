part of 'register_cubit.dart';

// SEALED: SIGNIFICA QUE ES UNA CLASE SELLADA Y LAS CLASES QUE HEREDEN ESTA CLASE DEBEN ESTAR EN EL MISMO ARCHIVO
// sealed class RegisterFormState extends Equatable {

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final Username username;
  final Email email;
  final Password password;
  final FormStatus formStatus;
  final bool isValid;

  const RegisterFormState(
      {this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.formStatus = FormStatus.invalid,
      this.isValid = false});

  @override
  List<Object> get props => [username, email, password, formStatus, isValid];

  RegisterFormState copyWith(
      {Username? username,
      Email? email,
      bool? isValid,
      Password? password,
      FormStatus? formStatus}) {
    return RegisterFormState(
        email: email ?? this.email,
        formStatus: formStatus ?? this.formStatus,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username);
  }
}
