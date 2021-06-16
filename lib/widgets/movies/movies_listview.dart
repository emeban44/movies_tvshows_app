import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/movie.dart';
import 'package:movies_tvshows_app/providers/movies_provider.dart';
import 'package:movies_tvshows_app/screens/movie_details_screen.dart';
import 'package:movies_tvshows_app/widgets/movies/movies_list_tile.dart';
import 'package:provider/provider.dart';

class MoviesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          Provider.of<Movies>(context, listen: false).fetchAndSetTopRatedMovies,
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Consumer<Movies>(
          builder: (ctx, movies, _) {
            final List<Movie> topMovies = movies.getMovies();
            return ListView.builder(
              itemBuilder: (ctx, i) {
                return InkWell(
                  child: MoviesListTile(topMovies[i], i),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        MovieDetailsScreen.routeName,
                        arguments: topMovies[i]);
                  },
                );
              },
              itemCount: topMovies.length,
            );
          },
        ),
      ),
    );
  }
}
