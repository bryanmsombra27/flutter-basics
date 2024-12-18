import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/screens/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const name = "home_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adBannerAsync = ref.watch(adBannerProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Miscelaneos"),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           context.push('/permissions');
      //         },
      //         icon: const Icon(Icons.settings))
      //   ],
      // ),
      // PUEDE TRABAJAR CON SLIVERS
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: CustomScrollView(
                // widgets que trabajan con scroll
                slivers: [
                  SliverAppBar(
                    title: const Text("Miscelaneos"),
                    actions: [
                      IconButton(
                          onPressed: () {
                            context.push('/permissions');
                          },
                          icon: const Icon(Icons.settings))
                    ],
                  ),
                  const MainManu()
                ],
              ),
            ),
          ),
          adBannerAsync.when(
              data: (banerAd) => SizedBox(
                    width: banerAd.size.width.toDouble(),
                    height: banerAd.size.height.toDouble(),
                    child: AdWidget(ad: banerAd),
                  ),
              error: (err, track) => Text("Error ad: $err"),
              loading: () => const SizedBox())
        ],
      ),
    );
  }
}
