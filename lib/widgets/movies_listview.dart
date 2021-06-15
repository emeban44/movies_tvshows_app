import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/movie.dart';
import 'package:movies_tvshows_app/providers/movies_provider.dart';
import 'package:movies_tvshows_app/widgets/movies_list_tile.dart';
import 'package:provider/provider.dart';

class MoviesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Provider.of<Movies>(context, listen: false).fetchAndSetTopRatedMovies();
    //  final List<Movie> topMovies = Provider.of<Movies>(context).getMovies();
    return RefreshIndicator(
      onRefresh:
          Provider.of<Movies>(context, listen: false).fetchAndSetTopRatedMovies,
      child: Container(
        child: Consumer<Movies>(
          builder: (ctx, movies, _) {
            final List<Movie> topMovies = movies.getMovies();
            return ListView.builder(
              itemBuilder: (ctx, i) {
                return MoviesListTile(topMovies[i]);
              },
              itemCount: topMovies.length,
            );
          },
        ),
      ),
    );
  }
}
