import 'package:flutter/material.dart';
import 'package:tok_tick_app/domain/entities/video_post.dart';
import 'package:tok_tick_app/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  final VideoPostRepository videoPostRepository;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));
    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
