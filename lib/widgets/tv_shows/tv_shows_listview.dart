import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/tv_show.dart';
import 'package:movies_tvshows_app/providers/tv_shows_provider.dart';
import 'package:movies_tvshows_app/screens/movie_details_screen.dart';
import 'package:movies_tvshows_app/screens/tv_show_details_screen.dart';
import 'package:movies_tvshows_app/widgets/tv_shows/tv_shows_list_tile.dart';
import 'package:provider/provider.dart';

class TvShowsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          Provider.of<TvShows>(context, listen: false).fetchAndSetTopTvShows,
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Consumer<TvShows>(
          builder: (ctx, tvShows, _) {
            final List<TvShow> topShows = tvShows.getTvShows();
            return ListView.builder(
              itemBuilder: (ctx, i) {
                return InkWell(
                  child: TvShowListTile(topShows[i], i, false),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        TvShowDetailsScreen.routeName,
                        arguments: topShows[i]);
                  },
                );
              },
              itemCount: topShows.length,
            );
          },
        ),
      ),
    );
  }
}
