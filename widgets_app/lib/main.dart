import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import "package:widgets_app/config/theme/app_theme.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // DEFINICION USANDO EL GO ROUTER
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardScreen()
      // },
      // home: const HomeScreen());
    );
  }
}
