import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/datasources/video_moviedb_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/video_repository_impl.dart';

//Este repositorio es inmutable(solo lectura)
final videosRepositoryProvider = Provider((ref) {
  return VideoRepositoryImpl(VideoMoviedbDatasourceImpl());
});
