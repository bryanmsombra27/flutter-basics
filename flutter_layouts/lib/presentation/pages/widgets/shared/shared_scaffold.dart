import 'package:flutter/material.dart';
import 'package:flutter_layouts/config/menu.dart';
import 'package:go_router/go_router.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({super.key, required this.child});

  static const name = "custom_scaffold";

  @override
  Widget build(BuildContext context) {
    final scafoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: child,
      key: scafoldKey,
      appBar: AppBar(
        title: const Text("Layouts de flutter"),
      ),
      drawer: SideMenu(
        scafoldKey: scafoldKey,
      ),
    );
  }
}

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
    required this.scafoldKey,
  });

  final GlobalKey<ScaffoldState> scafoldKey;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scafoldKey.currentState?.closeDrawer();
        },
        selectedIndex: navDrawerIndex,
        children: [
          const _Avatar(),
          ...appMenuItems.map((menuItem) => NavigationDrawerDestination(
              icon: Icon(menuItem.icon), label: Text(menuItem.title)))
        ]);
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      child: const CircleAvatar(
        child: Text(
          'BJ',
          style: TextStyle(fontSize: 50, color: Colors.blue),
        ),
      ),
    );
  }
}
