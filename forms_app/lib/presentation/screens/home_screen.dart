import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text("cubits"),
            subtitle: const Text("gestor de estado simple"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              context.push("/cubits");
            },
          ),
          ListTile(
            title: const Text("Bloc"),
            subtitle: const Text("gestor de estado compuesto"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              context.push("/bloc");
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: const Text("Nuevo usuario"),
            subtitle: const Text("Manejo de formularios"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              context.push("/new-user");
            },
          ),
        ],
      ),
    );
  }
}
