import 'package:tok_tick_app/domain/datasources/video_post_datasource.dart';
import 'package:tok_tick_app/domain/entities/video_post.dart';
import 'package:tok_tick_app/infrastructure/models/local_video_model.dart';
import 'package:tok_tick_app/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<VideoPost> getFavoriteVideosByUser(int userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
