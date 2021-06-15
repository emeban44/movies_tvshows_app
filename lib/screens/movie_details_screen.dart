import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/movie.dart';
import 'package:movies_tvshows_app/widgets/backdrop.dart';
import 'package:movies_tvshows_app/widgets/overview.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context).settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        child: Column(
          children: [
            BackdropImage(
              'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
            ),
            Overview(movie.overview),
          ],
        ),
      ),
    );
  }
}
