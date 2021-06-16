import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/movie.dart';
import 'package:movies_tvshows_app/models/tv_show.dart';
import 'package:movies_tvshows_app/providers/movies_provider.dart';
import 'package:movies_tvshows_app/providers/tv_shows_provider.dart';
import 'package:movies_tvshows_app/widgets/backdrop.dart';
import 'package:movies_tvshows_app/widgets/overview.dart';
import 'package:movies_tvshows_app/widgets/ratings_row.dart';
import 'package:provider/provider.dart';

class TvShowDetailsScreen extends StatelessWidget {
  static const routeName = '/tvShow-details';

  @override
  Widget build(BuildContext context) {
    final tvShow = ModalRoute.of(context).settings.arguments as TvShow;
    final index = Provider.of<TvShows>(context).getTvShows().indexOf(tvShow);
    return Scaffold(
      appBar: AppBar(
        title: Text(tvShow.originalName),
      ),
      body: Container(
        child: Column(
          children: [
            BackdropImage(
              'https://image.tmdb.org/t/p/w500${tvShow.backdropPath}',
            ),
            Overview(tvShow.overview),
            //  RatingsRow(tvShow, index),
          ],
        ),
      ),
    );
  }
}
