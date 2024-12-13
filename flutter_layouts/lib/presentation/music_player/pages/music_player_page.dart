import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/music_player/widgets/widgets.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  static const name = "music_player_page";

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Background(),
            Column(
              children: [
                CustomAppbar(),
                ImageDiskDuration(),
                TitlePlay(),
                Expanded(child: Lyrics())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
