import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/music_player/helpers/helpers.dart';

class Lyrics extends StatelessWidget {
  const Lyrics({super.key});

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ListWheelScrollView(
        itemExtent: 42,
        children: lyrics
            .map((line) => Text(
                  line,
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(.6)),
                ))
            .toList(),
        diameterRatio: 1.5,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
