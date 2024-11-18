import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: "/cubits",
    builder: (context, state) => const CubitScreen(),
  ),
  GoRoute(
    path: "/bloc",
    builder: (context, state) => const BlockScreen(),
  ),
  GoRoute(
    path: "/new-user",
    builder: (context, state) => const RegisterScreen(),
  ),
]);
