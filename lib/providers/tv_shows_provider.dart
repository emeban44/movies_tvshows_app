import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../helpers/sharedPrefs.dart';
import '../models/tv_show.dart';

class TvShows with ChangeNotifier {
  List<TvShow> _tvShows = [];
  List<TvShow> _searchedTvShows = [];

  List<TvShow> getTvShows() {
    return [..._tvShows];
  }

  List<TvShow> getSearchedTvShows() {
    return [..._searchedTvShows];
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

  Future<void> fetchSearchedTvShows(String search) async {
    if (SharedPrefs().getOverTwoCharactersBool) {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/search/tv?api_key=f1a036ef23dc9704fb60a521327ff1c7&language=en-US&page=1&query=$search&include_adult=false');
      List<TvShow> searchedTvShows = [];
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
        List<TvShow> searchedTvShowsUnfiltered =
            TopShows.fromJson(jsonMap).topShows;
        searchedTvShowsUnfiltered
            .sort((a, b) => a.voteCount.compareTo(b.voteCount));
        searchedTvShowsUnfiltered = searchedTvShowsUnfiltered.reversed.toList();
        for (int i = 0; i < searchedTvShowsUnfiltered.length; i++)
          if (searchedTvShowsUnfiltered[i].posterPath != null)
            searchedTvShows.add(searchedTvShowsUnfiltered[i]);
        // print(searchedMovies);
      } catch (error) {
        print('error');
        print(error);
      }
      _searchedTvShows = searchedTvShows;
      notifyListeners();
    }
    // return _searchedMovies;
  }
}
