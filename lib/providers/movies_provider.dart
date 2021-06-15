import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_tvshows_app/models/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> getMovies() {
    return [..._movies];
  }

  Future<void> fetchAndSetTopRatedMovies() async {
    final url = Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=f1a036ef23dc9704fb60a521327ff1c7&page=1',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        print("Error, failed to load movies");
        return "Failed to load movies";
      }
      print('ok');
      final jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      final List<Movie> movies = TopMovies.fromJson(jsonMap).movies;
      for (int i = 0; i < 10; i++) _movies.add(movies[i]);
    } catch (error) {
      print(error);
    }
  }
}
