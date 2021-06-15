import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/movie.dart';
import 'package:movies_tvshows_app/providers/movies_provider.dart';
import 'package:movies_tvshows_app/widgets/backdrop.dart';
import 'package:movies_tvshows_app/widgets/overview.dart';
import 'package:movies_tvshows_app/widgets/ratings_row.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context).settings.arguments as Movie;
    final index = Provider.of<Movies>(context).getMovies().indexOf(movie);
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
            RatingsRow(movie, index),
          ],
        ),
      ),
    );
  }
}
