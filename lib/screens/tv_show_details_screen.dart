import 'package:flutter/material.dart';

import '../widgets/ratings_row.dart';
import '../models/tv_show.dart';
import '../widgets/backdrop.dart';
import '../widgets/overview.dart';

class TvShowDetailsScreen extends StatelessWidget {
  static const routeName = '/tvShow-details';

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
    final tvShow = ModalRoute.of(context).settings.arguments as TvShow;
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
            RatingsRow(tvShow.voteCount, tvShow.voteAverage),
          ],
        ),
      ),
    );
  }
}
