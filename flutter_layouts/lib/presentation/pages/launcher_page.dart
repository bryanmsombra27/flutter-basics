import 'package:flutter/material.dart';
import 'package:flutter_layouts/config/app_theme.dart';
import 'package:flutter_layouts/config/menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  static const name = "launcher_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Launcher page"),
        ),
        drawer: const _MenuPrincipal(),
        body: const _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider(
          height: .5,
          color: Colors.blue,
        );
      },
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const FaIcon(
            FontAwesomeIcons.slideshare,
            color: Colors.blue,
          ),
          onTap: () {
            context.push(appMenuItems[index].link);
          },
          title: Text(appMenuItems[index].title),
          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<AppTheme>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.all(20),
                child: const CircleAvatar(
                  child: Text(
                    'BJ',
                    style: TextStyle(fontSize: 50, color: Colors.blue),
                  ),
                ),
              ),
            ),
            const Expanded(child: _ListaOpciones()),
            ListTile(
              leading: const Icon(
                Icons.lightbulb_outlined,
                color: Colors.blue,
              ),
              title: const Text("Dark Mode"),
              trailing: Switch.adaptive(
                  value: appThemeProvider.darkMode,
                  onChanged: (value) {
                    appThemeProvider.darkMode = value;
                  }),
            ),
            ListTile(
              leading: const Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: const Text("Custom Theme"),
              trailing: Switch.adaptive(
                value: appThemeProvider.customTheme,
                onChanged: (value) {
                  appThemeProvider.customTheme = value;
                },
                activeColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
