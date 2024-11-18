import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scafoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(
        scafoldKey: scafoldKey,
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      onTap: () {
        // FORMAS DE NAVEGAR CON FLUTTER (NAVEGACION NATIVA DE FLUTTER)
        // FORMA 1 DE DECLARAR UNA NAVEGACION A UNA PAGINA
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        // Navigator.pushNamed(context, menuItem.link);

        // FORMAS DE NAVEGAR CON GO ROUTER
        // NAVEGACION CON GO ROUTER  FORMA 1 CON EL PATH
        context.push(menuItem.link);

        //NAVEGACION CUANDO SE ASIGNA UN NOMBRE A LA RUTA FORMA 2 CON EL NOMBRE ASIGNADO AL PATH
        // context.pushNamed(CardScreen.name);
      },
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
    );
  }
}
