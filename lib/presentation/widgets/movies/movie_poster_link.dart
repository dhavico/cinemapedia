import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => context.push('/home/0/movie/${movie.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.network(movie.posterPath),
              // Center(
              //     child: Container(
              //   color: Colors.white,
              //   child: Text(
              //     movie.isarId.toString(),
              //     style: const TextStyle(
              //         fontSize: 20, fontWeight: FontWeight.w800),
              //   ),
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
