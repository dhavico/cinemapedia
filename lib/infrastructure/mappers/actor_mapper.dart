import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: (cast.profilePath != null)
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://cdn.vectorstock.com/i/preview-1x/85/94/person-gray-photo-placeholder-man-silhouette-sign-vector-23838594.jpg',
      character: cast.character);
}
