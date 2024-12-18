import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem({required this.title, required this.icon, required this.route});
}

final menuItems = <MenuItem>[
  MenuItem(title: 'Giroscopio', icon: Icons.downloading, route: "/gyroscope"),
  MenuItem(title: 'Acelerometro', icon: Icons.speed, route: "/accelerometer"),
  MenuItem(
      title: 'Magnetometro',
      icon: Icons.explore_outlined,
      route: "/magnetometer"),
  MenuItem(title: 'Brujula', icon: Icons.explore, route: "/compass"),
  MenuItem(
      title: 'Giroscopio Ball',
      icon: Icons.sports_baseball_sharp,
      route: "/gyroscope-ball"),
  MenuItem(title: 'Pokemons', icon: Icons.catching_pokemon, route: "/pokemons"),
  MenuItem(title: 'Biometrics', icon: Icons.fingerprint, route: "/biometrics"),
  MenuItem(title: 'Ubicacion', icon: Icons.pin_drop, route: "/location"),
  MenuItem(title: 'Mapas', icon: Icons.map_outlined, route: "/map"),
  MenuItem(
      title: 'Controlado',
      icon: Icons.gamepad_outlined,
      route: "/controlled-map"),
  MenuItem(title: 'Badge', icon: Icons.notification_important, route: "/badge"),
  MenuItem(
      title: 'Ad Full', icon: Icons.ad_units_outlined, route: "/ad-fullscreen"),
  MenuItem(title: 'Ad Reward', icon: Icons.fort_sharp, route: "/ad-rewarded"),
  MenuItem(
      title: 'Background Process',
      icon: Icons.storage_rounded,
      route: "/db-pokemons"),
];

class MainManu extends StatelessWidget {
  const MainManu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverGrid.count(
      crossAxisCount: screenWidth < 600 ? 2 : 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map((item) => _HomeMenuItem(
              title: item.title, icon: item.icon, route: item.route))
          .toList(),
    );
  }
}

class _HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> colors = const [Colors.lightBlue, Colors.blue];

  const _HomeMenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(route);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
