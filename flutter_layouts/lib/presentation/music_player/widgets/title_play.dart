import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/music_player/models/audioplayer_model.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class TitlePlay extends StatefulWidget {
  const TitlePlay({super.key});

  @override
  State<TitlePlay> createState() => _TitlePlayState();
}

class _TitlePlayState extends State<TitlePlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool firstTime = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void open() {
      // void open(BuildContext context) {
      final audioPlayerProvider =
          Provider.of<AudioplayerModel>(context, listen: false);

      assetsAudioPlayer.open(
          Audio('assets/music_player/Breaking-Benjamin-Far-Away.mp3'),
          autoStart: true,
          showNotification: true);
      assetsAudioPlayer.currentPosition.listen((duration) {
        audioPlayerProvider.currentSongDuration = duration;
      });

      assetsAudioPlayer.current.listen((playingAudio) {
        audioPlayerProvider.songDuration =
            playingAudio?.audio.duration ?? const Duration(seconds: 0);
      });
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Far away',
                style: TextStyle(
                    fontSize: 30, color: Colors.white.withOpacity(.8)),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(
                    fontSize: 15, color: Colors.white.withOpacity(.8)),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {
              final AnimationController controllerDisk =
                  Provider.of<AudioplayerModel>(context, listen: false)
                      .controller;

              if (isPlaying) {
                controller.reverse();
                isPlaying = false;
                controllerDisk.stop();
              } else {
                controller.forward();
                controllerDisk.repeat();
                isPlaying = true;

                if (firstTime) {
                  open();
                  firstTime = false;
                } else {
                  assetsAudioPlayer.playOrPause();
                }
              }
            },
            backgroundColor: const Color(0xfff8cb51),
            child: AnimatedIcon(
              progress: controller,
              icon: AnimatedIcons.play_pause,
            ),
          )
        ],
      ),
    );
  }
}
