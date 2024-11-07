import 'package:tok_tick_app/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<VideoPost> getFavoriteVideosByUser(int userId);
}
