import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_provider.dart';
import '../../screens/movie_details_screen.dart';
import '../../widgets/movies/movies_list_tile.dart';

class SearchedMoviesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Consumer<Movies>(
        builder: (ctx, movies, _) {
          final List<Movie> searchedMovies = movies.getSearchedMovies();
          if (searchedMovies.isEmpty)
            return Container(
              margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: Text(
                'No movie found or the API has null arguments for this particular search. Try typing the full title.',
                textAlign: TextAlign.center,
              ),
            );
          return ListView.builder(
            itemBuilder: (ctx, i) {
              return InkWell(
                child: MoviesListTile(searchedMovies[i], i, true),
                onTap: () {
                  Navigator.of(context).pushNamed(MovieDetailsScreen.routeName,
                      arguments: searchedMovies[i]);
                },
              );
            },
            itemCount: searchedMovies.length,
          );
        },
      ),
    );
  }
}
