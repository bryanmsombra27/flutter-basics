import 'package:flutter/material.dart';
import 'package:flutter_layouts/config/app_routes.dart';
import 'package:flutter_layouts/config/app_theme.dart';
import 'package:flutter_layouts/presentation/music_player/models/audioplayer_model.dart';
import 'package:flutter_layouts/presentation/shoes_app/models/shoe_model.dart';

import 'package:provider/provider.dart';

void main() {
  return runApp(
      // ChangeNotifierProvider(create: (_) => AppTheme(), child: const MyApp()));
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppTheme()),
      ChangeNotifierProvider(create: (_) => ShoeModel()),
      ChangeNotifierProvider(create: (_) => AudioplayerModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<AppTheme>(context).darkMode;

    return MaterialApp.router(
      routerConfig: routes,
      title: 'Flutter Layouts',
      theme: AppTheme().getTheme(isDarkMode),
      themeMode: ThemeMode.dark,
    );
  }
}
