import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_tvshows_app/models/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  Future<void> testApi() async {
    final url = Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=f1a036ef23dc9704fb60a521327ff1c7&page=1',
    );
    final response = await http.get(url);
    final jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    final List<Movie> movies = TopMovies.fromJson(jsonMap).movies;
    //  final something = Movie.fromJson(jsonMap['results']);
    print(movies[3].title);
  }
}
