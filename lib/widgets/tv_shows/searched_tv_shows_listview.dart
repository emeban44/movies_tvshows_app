import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/tv_show.dart';
import 'package:movies_tvshows_app/providers/tv_shows_provider.dart';
import 'package:movies_tvshows_app/screens/tv_show_details_screen.dart';
import 'package:movies_tvshows_app/widgets/tv_shows/tv_shows_list_tile.dart';
import 'package:provider/provider.dart';

class SearchedTvShowsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Consumer<TvShows>(
        builder: (ctx, tvShows, _) {
          final List<TvShow> searchedShows = tvShows.getSearchedTvShows();
          if (searchedShows.isEmpty)
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                'No TV show found or the API has null arguments for this particular search. Try typing the full title.',
                textAlign: TextAlign.center,
              ),
            );
          return ListView.builder(
            itemBuilder: (ctx, i) {
              return InkWell(
                child: TvShowListTile(searchedShows[i], i, true),
                onTap: () {
                  Navigator.of(context).pushNamed(TvShowDetailsScreen.routeName,
                      arguments: searchedShows[i]);
                },
              );
            },
            itemCount: searchedShows.length,
          );
        },
      ),
    );
  }
}
