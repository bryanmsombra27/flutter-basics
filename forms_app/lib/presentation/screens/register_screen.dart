import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const name = "register_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nuevo usuario"),
        ),
        body: BlocProvider(
            create: (context) => RegisterCubit(),
            child: const _RegisterView()));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            FlutterLogo(
              size: 100,
            ),
            _RegisterForm(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      // key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Nombre del usuario",
            onChanged: registerCubit.usernameChanged,
            erorrMessage: username.errorMessage,
            // erorrMessage: username.isValid || username.isPure
            //     ? null
            //     : 'Usuario no valido',
            // validator: (value) {

            //   if (value == null || value.isEmpty) return "campo requerido";
            //   if (value.trim().isEmpty) return "campo requerido";
            //   if (value.length < 6) return "Mayor a 6 letras";

            //   // SI RETORNA NULO QUIERE DECIR QUE PASO LAS VALIDACIONES CORRECTAMENTE
            //   return null;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Email',
            erorrMessage: email.errorMessage,
            onChanged: registerCubit.emailChanged,

            // _formKey.currentState?.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return "campo requerido";
            //   if (value.trim().isEmpty) return "campo requerido";
            //   if (value.length < 6) return "Mayor a 6 letras";

            //   final emailRegExp = RegExp(
            //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            //   );

            //   if (!emailRegExp.hasMatch(value)) {
            //     return "debe ser un email valido";
            //   }

            //   // SI RETORNA NULO QUIERE DECIR QUE PASO LAS VALIDACIONES CORRECTAMENTE
            //   return null;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            passwordType: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              // _formKey.currentState?.validate();
            },
            erorrMessage: password.errorMessage,
            // validator: (value) {
            //   if (value == null || value.isEmpty) return "campo requerido";
            //   if (value.trim().isEmpty) return "campo requerido";
            //   if (value.length > 6) return "Mayor a 6 letras";

            //   // SI RETORNA NULO QUIERE DECIR QUE PASO LAS VALIDACIONES CORRECTAMENTE
            //   return null;
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
              icon: const Icon(Icons.save),
              onPressed: () {
                // ejecutar las validaciones de los inputs
                // final isValid = _formKey.currentState!.validate();

                // if (!isValid) return;

                registerCubit.onSubmit();
              },
              label: const Text("Crear usuario")),
        ],
      ),
    );
  }
}
