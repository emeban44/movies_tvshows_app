import 'package:flutter/material.dart';

import '../../models/tv_show.dart';

class TvShowListTile extends StatelessWidget {
  final TvShow tvShow;
  final int index;
  final bool isSearching;
  TvShowListTile(this.tvShow, this.index, this.isSearching);
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
              'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
            ),
          ),
          title: isSearching
              ? Text(tvShow.originalName)
              : Text(position.toString() + '. ' + tvShow.originalName),
          subtitle: Text('(' +
              tvShow.firstAirDate.toString().substring(0, 4) +
              ')' +
              ', Total votes: ' +
              tvShow.voteCount.toString()),
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
                tvShow.voteAverage.toString(),
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
