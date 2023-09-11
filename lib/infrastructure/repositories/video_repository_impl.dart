import 'package:cinemapedia/domain/datasources/videos_datasource.dart';
import 'package:cinemapedia/domain/entities/video.dart';
import 'package:cinemapedia/domain/repositories/videos_repository.dart';

class VideoRepositoryImpl extends VideosRepository {
  final VideosDatasource datasource;

  VideoRepositoryImpl(this.datasource);

  @override
  Future<List<Video>> getVideosByMovie(String movieId) {
    return datasource.getVideosByMovie(movieId);
  }
}
