import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        name: HomeScreen.name),
    GoRoute(
        path: '/buttons',
        builder: (context, state) => const ButtonsScreen(),
        name: ButtonsScreen.name),
    GoRoute(
        path: '/cards',
        builder: (context, state) => const CardScreen(),
        name: CardScreen.name),
  ],
);
