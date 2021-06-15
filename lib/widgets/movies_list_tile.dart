import 'package:flutter/material.dart';

import '../models/movie.dart';

class MoviesListTile extends StatelessWidget {
  final Movie movie;
  final int index;
  MoviesListTile(this.movie, this.index);
  @override
  Widget build(BuildContext context) {
    int position = index + 1;
    return Container(
      height: 90,
      child: Center(
        child: ListTile(
          leading: SizedBox(
            height: 85,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            ),
          ),
          title: Text(position.toString() + '. ' + movie.title),
          subtitle: Text('(' +
              movie.releaseDate.toString().substring(0, 4) +
              ')' +
              ', Total votes: ' +
              movie.voteCount.toString()),
          trailing: CircleAvatar(
            child: Text(movie.voteAverage.toString()),
          ),
        ),
      ),
    );
  }
}
