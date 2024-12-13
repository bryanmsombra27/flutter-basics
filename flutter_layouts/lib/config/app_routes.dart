import 'package:flutter_layouts/presentation/animate_do_app/pages.dart';
import 'package:flutter_layouts/presentation/music_player/pages/music_player_page.dart';
import 'package:flutter_layouts/presentation/pages/widgets/widgets.dart';
import 'package:flutter_layouts/presentation/shoes_app/pages/pages.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_layouts/presentation/pages/pages.dart';
import 'package:flutter_layouts/presentation/retos/cuadrado_animado.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LauncherPage(),
  ),
  GoRoute(
    path: '/gradient-page',
    builder: (context, state) => const CustomScaffold(child: HeaderPage()),
  ),
  GoRoute(
    path: '/curve',
    builder: (context, state) => const CustomScaffold(child: HeaderCurvo()),
  ),
  GoRoute(
    path: '/wave',
    builder: (context, state) => const CustomScaffold(child: HeaderWaves()),
  ),
  GoRoute(
    path: '/triangle',
    builder: (context, state) => const CustomScaffold(child: HeaderTriangle()),
  ),
  GoRoute(
    path: '/pico',
    builder: (context, state) => const CustomScaffold(child: HeaderPico()),
  ),
  GoRoute(
    path: '/diagonal',
    builder: (context, state) => const CustomScaffold(child: HeaderDiagonal()),
  ),
  GoRoute(
    path: '/rounded',
    builder: (context, state) =>
        const CustomScaffold(child: HeaderBorderRounded()),
  ),
  GoRoute(
    path: '/animations',
    builder: (context, state) => const CustomScaffold(child: AnimacionesPage()),
  ),
  GoRoute(
    path: '/square-animation',
    builder: (context, state) =>
        const CustomScaffold(child: CuadradoAnimadoReto()),
  ),
  GoRoute(
    path: '/circular-progress',
    builder: (context, state) =>
        const CustomScaffold(child: CircularProgressPage()),
  ),
  GoRoute(
    path: '/circular-graphic-page',
    builder: (context, state) =>
        const CustomScaffold(child: CircularGraphicsPage()),
  ),
  GoRoute(
    path: '/slideshow-page',
    builder: (context, state) => const CustomScaffold(child: SlideshowPage()),
  ),
  GoRoute(
    path: '/slideshow-custom',
    builder: (context, state) =>
        const CustomScaffold(child: SlideshowSharedWidgetPage()),
  ),
  GoRoute(
    path: '/pinterest-page',
    builder: (context, state) => const CustomScaffold(child: (PinterestPage())),
  ),
  GoRoute(
    path: '/emergency-page',
    builder: (context, state) => const CustomScaffold(child: (EmergencyPage())),
  ),
  GoRoute(
    path: '/sliverlist-page',
    builder: (context, state) =>
        const CustomScaffold(child: (SliverlistPage())),
  ),
  GoRoute(
    path: '/animate_do',
    builder: (context, state) => const CustomScaffold(child: (Page1())),
  ),
  GoRoute(
    path: '/twitter-page',
    builder: (context, state) => const CustomScaffold(child: (TwitterPage())),
  ),
  GoRoute(
    path: '/navigation-page',
    builder: (context, state) =>
        const CustomScaffold(child: (NavigationPage())),
  ),
  GoRoute(
    path: '/shoes-page',
    builder: (context, state) => const CustomScaffold(child: (ShoePage())),
  ),
  GoRoute(
    path: '/shoe-description-page',
    builder: (context, state) =>
        const CustomScaffold(child: (ShoeDescriptionPage())),
  ),
  GoRoute(
      path: '/music-player-page',
      builder: (context, state) => const MusicPlayerPage()),
]);
