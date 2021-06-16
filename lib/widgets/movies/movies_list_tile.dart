import 'package:flutter/material.dart';

import '../../models/movie.dart';

class MoviesListTile extends StatelessWidget {
  final Movie movie;
  final int index;
  final bool isSearching;
  MoviesListTile(this.movie, this.index, this.isSearching);
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
          title: isSearching
              ? Text(movie.title)
              : Text(position.toString() + '. ' + movie.title),
          subtitle: Text('(' +
              movie.releaseDate.toString().substring(0, 4) +
              ')' +
              ', Total votes: ' +
              movie.voteCount.toString()),
          trailing: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade300,
                    Colors.blueGrey.shade400,
                  ],
                ),
                borderRadius: BorderRadius.circular(10)),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Text(
                movie.voteAverage.toString(),
                style: TextStyle(
                  color: Colors.grey.shade100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
