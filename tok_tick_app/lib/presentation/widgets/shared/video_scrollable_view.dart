import 'package:flutter/material.dart';
import 'package:tok_tick_app/domain/entities/video_post.dart';
import 'package:tok_tick_app/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tick_app/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videopost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullscreenPlayer(
                caption: videopost.caption,
                videoUrl: videopost.videoUrl,
              ),
            ),
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videopost))
          ],
        );
      },
    );
  }
}
