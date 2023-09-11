import 'package:cinemapedia/domain/entities/video.dart';

abstract class VideosDatasource {
  Future<List<Video>> getVideosByMovie(String movieId);
}
