import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tv_show.dart';
import '../providers/tv_shows_provider.dart';
import '../widgets/backdrop.dart';
import '../widgets/overview.dart';

class TvShowDetailsScreen extends StatelessWidget {
  static const routeName = '/tvShow-details';

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
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
