import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/music_player/models/audioplayer_model.dart';
import 'package:flutter_layouts/presentation/music_player/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ImageDiskDuration extends StatelessWidget {
  const ImageDiskDuration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.only(top: 70),
      child: const Row(
        children: [
          _ImageDisk(),
          SizedBox(
            width: 10,
          ),
          Progressbar(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class _ImageDisk extends StatelessWidget {
  const _ImageDisk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final audioPlayerProvider = Provider.of<AudioplayerModel>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(
            colors: [
              Color(0xff484750),
              Color(0xff1e1c24),
            ],
            begin: Alignment.topLeft,
          )),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
                manualTrigger: true,
                controller: (animationController) =>
                    audioPlayerProvider.controller = animationController,
                duration: const Duration(seconds: 10),
                infinite: true,
                child: Image.asset('assets/music_player/aurora.jpg')),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Color(0xff1c125),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
    );
  }
}
