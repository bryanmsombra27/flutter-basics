import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/permissions',
    builder: (context, state) => const PermissionsScreen(),
  ),
  GoRoute(
    path: '/accelerometer',
    builder: (context, state) => const AccelerometerScreen(),
  ),
  GoRoute(
    path: '/magnetometer',
    builder: (context, state) => const MagnetometerScreen(),
  ),
  GoRoute(
    path: '/gyroscope',
    builder: (context, state) => const GiroscopeScreen(),
  ),
  GoRoute(
    path: '/compass',
    builder: (context, state) => const CompassScreen(),
  ),
  GoRoute(
    path: '/gyroscope-ball',
    builder: (context, state) => const GiroscopeBallScreen(),
  ),
  GoRoute(
    path: '/biometrics',
    builder: (context, state) => const BiometricsScreen(),
  ),
  GoRoute(
    path: '/location',
    builder: (context, state) => const LocationScreen(),
  ),
  GoRoute(
    path: '/map',
    builder: (context, state) => const MapScreen(),
  ),
  GoRoute(
    path: '/controlled-map',
    builder: (context, state) => const ControlledMapScreen(),
  ),
  GoRoute(
    path: '/badge',
    builder: (context, state) => const BadgeScreen(),
  ),
  GoRoute(
    path: '/ad-fullscreen',
    builder: (context, state) => const AdFullscreen(),
  ),
  GoRoute(
    path: '/ad-rewarded',
    builder: (context, state) => const AdRewardedScreen(),
  ),
  GoRoute(
    path: '/db-pokemons',
    builder: (context, state) => const DbPokemonsScreen(),
  ),
  GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '1';

              return PokemonScreen(id: id);
            })
      ]),
]);
