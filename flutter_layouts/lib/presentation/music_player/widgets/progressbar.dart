import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/music_player/models/audioplayer_model.dart';
import 'package:provider/provider.dart';

class Progressbar extends StatelessWidget {
  const Progressbar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(color: Colors.white.withOpacity(.4));
    final audioPlayerProvider = Provider.of<AudioplayerModel>(context);
    final porcentaje = audioPlayerProvider.porcentaje;

    return Container(
      child: Column(
        children: [
          Text(
            '${audioPlayerProvider.songTotalDuration}',
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 230 * porcentaje,
                  color: Colors.white.withOpacity(.8),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${audioPlayerProvider.currentSecond}',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
