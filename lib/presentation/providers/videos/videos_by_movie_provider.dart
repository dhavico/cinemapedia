import 'package:cinemapedia/domain/entities/video.dart';
import 'package:cinemapedia/presentation/providers/videos/videos_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videosByMovieProvider =
    StateNotifierProvider<VideoByMovieNotifier, Map<String, List<Video>>>(
        (ref) {
  final videosRepository = ref.watch(videosRepositoryProvider);
  return VideoByMovieNotifier(getVideos: videosRepository.getVideosByMovie);
});

typedef GetVideosCallback = Future<List<Video>> Function(String movieId);

class VideoByMovieNotifier extends StateNotifier<Map<String, List<Video>>> {
  final GetVideosCallback getVideos;
  VideoByMovieNotifier({required this.getVideos}) : super({});

  Future<void> loadVideos(String movieId) async {
    if (state[movieId] != null) return;

    final List<Video> videos = await getVideos(movieId);
    state = {...state, movieId: videos};
  }
}
