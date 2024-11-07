import 'package:tok_tick_app/domain/datasources/video_post_datasource.dart';
import 'package:tok_tick_app/domain/entities/video_post.dart';
import 'package:tok_tick_app/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videosDatasource;

  VideoPostsRepositoryImpl({required this.videosDatasource});

  @override
  Future<VideoPost> getFavoriteVideosByUser(int userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
