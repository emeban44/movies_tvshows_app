import 'package:flutter/material.dart';

import '../models/movie.dart';

class MoviesListTile extends StatelessWidget {
  final Movie movie;
  MoviesListTile(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListTile(
        leading: SizedBox(
          height: 70,
          child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
        ),
      ),
    );
  }
}
