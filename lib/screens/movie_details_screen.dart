import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../providers/movies_provider.dart';
import '../widgets/backdrop.dart';
import '../widgets/overview.dart';
import '../widgets/ratings_row.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
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
            RatingsRow(movie.voteCount, movie.voteAverage),
          ],
        ),
      ),
    );
  }
}
