import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
              ),
            ),
            Container(
              child: Center(
                  child: Text(
                movie.overview,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17),
              )),
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
