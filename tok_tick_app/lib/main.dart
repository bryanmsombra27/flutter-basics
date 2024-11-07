import 'package:flutter/material.dart';
import 'package:tok_tick_app/config/app_theme.dart';
import 'package:tok_tick_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tick_app/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tok_tick_app/presentation/providers/discover_provider.dart';
import 'package:tok_tick_app/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              DiscoverProvider(videoPostRepository: videoPostRepository)
                ..loadNextPage(),
        )
      ],
      child: MaterialApp(
          title: 'Tock Tick',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
