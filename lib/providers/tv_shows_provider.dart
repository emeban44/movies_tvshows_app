import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_tvshows_app/models/tv_show.dart';

class TvShows with ChangeNotifier {
  List<TvShow> _tvShows = [];

  List<TvShow> getTvShows() {
    return [..._tvShows];
  }

  Future<void> fetchAndSetTopTvShows() async {
    final url = Uri.parse(
      'https://api.themoviedb.org/3/tv/top_rated?api_key=f1a036ef23dc9704fb60a521327ff1c7&language=en-US&page=1',
    );
    try {
      final response = await http.get(url);
      // print(response.body);
      if (response.statusCode != 200) {
        print("Error, failed to load tv shows");
        return "Failed to load tv shows";
      }
      print('ok');
      final jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      final List<TvShow> tvShows = TopShows.fromJson(jsonMap).topShows;
      for (int i = 1; i < 11; i++) _tvShows.add(tvShows[i]);
    } catch (error) {
      print(error);
    }
  }

  // Future<Movie> fetchMovieDetails(int id) async {
  //   final url = Uri.parse(
  //       'https://api.themoviedb.org/3/movie/$id?api_key=f1a036ef23dc9704fb60a521327ff1c7&language=en-US');
  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode != 200) {
  //       print("Error, failed to load movie details");
  //       throw "Error";
  //     }
  //     final jsonString = response.body;
  //     var jsonMap = json.decode(jsonString);
  //     final Movie movie = Movie.fromJson(jsonMap);
  //     return movie;
  //   } catch (error) {
  //     print(error.message);
  //   }
  //   return null;
  // }
}
