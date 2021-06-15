import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/movie.dart';

class RatingsRow extends StatelessWidget {
  final Movie movie;
  final int index;
  RatingsRow(this.movie, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         colors: [Colors.blue.shade400, Colors.blueGrey.shade700])),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: TextButton.icon(
              icon: Icon(
                Icons.star,
                color: Colors.blue.shade900,
                size: 35,
              ),
              label: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              onPressed: null,
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              '#' + (index + 1).toString(),
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}