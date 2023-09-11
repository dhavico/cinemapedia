import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/videos_datasource.dart';
import 'package:cinemapedia/domain/entities/video.dart';
import 'package:cinemapedia/infrastructure/mappers/video_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/videos_response.dart';

class VideoMoviedbDatasourceImpl extends VideosDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-PE'
      }));

  @override
  Future<List<Video>> getVideosByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/videos');

    final castDBResponse = VideosResponse.fromJson(response.data);
    final List<Video> actors = castDBResponse.results
        .map((actor) => VideoMapper.resultToEntity(actor))
        .toList();

    return actors;
  }
}
