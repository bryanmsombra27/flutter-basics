import 'package:formz/formz.dart';

// Define input validation errors
enum UserNameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UserNameInputError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UserNameInputError.empty) {
      return "el campo es requerido";
    }
    if (displayError == UserNameInputError.empty) {
      return "minimo 6 caracteres";
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UserNameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UserNameInputError.empty;

    if (value.length < 6) return UserNameInputError.length;

    return null;
  }
}
