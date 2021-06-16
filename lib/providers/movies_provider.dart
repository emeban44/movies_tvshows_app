import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_tvshows_app/helpers/sharedPrefs.dart';
import 'package:movies_tvshows_app/models/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> _searchedMovies = [];

  List<Movie> getMovies() {
    return [..._movies];
  }

  List<Movie> getSearchedMovies() {
    return [..._searchedMovies];
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

  Future<Movie> fetchMovieDetails(int id) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=f1a036ef23dc9704fb60a521327ff1c7&language=en-US');
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        print("Error, failed to load movie details");
        throw "Error";
      }
      final jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      final Movie movie = Movie.fromJson(jsonMap);
      return movie;
    } catch (error) {
      print(error.message);
    }
    return null;
  }

  Future<void> fetchSearchedMovies(String search) async {
    if (SharedPrefs().getOverTwoCharactersBool) {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=f1a036ef23dc9704fb60a521327ff1c7&language=en-US&query=$search&page=1&include_adult=false');
      List<Movie> searchedMovies = [];
      try {
        final response = await http.get(url);
        if (response.statusCode != 200) {
          print("Error, failed to load movies");
          throw null;
        }
        print('ok');
        // print(response.body);
        final jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        List<Movie> searchedMoviesUnfiltered =
            TopMovies.fromJson(jsonMap).movies;
        searchedMoviesUnfiltered
            .sort((a, b) => a.voteCount.compareTo(b.voteCount));
        searchedMoviesUnfiltered = searchedMoviesUnfiltered.reversed.toList();
        for (int i = 0; i < searchedMoviesUnfiltered.length; i++)
          if (searchedMoviesUnfiltered[i].posterPath != null)
            searchedMovies.add(searchedMoviesUnfiltered[i]);
        // print(searchedMovies);
      } catch (error) {
        print('error');
        print(error);
      }
      _searchedMovies = searchedMovies;
      notifyListeners();
    }
    // return _searchedMovies;
  }
}
