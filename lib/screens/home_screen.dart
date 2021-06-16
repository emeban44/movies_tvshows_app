import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../providers/tv_shows_provider.dart';
import '../widgets/movies/movies_listview.dart';
import '../widgets/movies/searched_movies_listview.dart';
import '../widgets/search_box.dart';
import '../widgets/toggle_widget.dart';
import '../widgets/tv_shows/searched_tv_shows_listview.dart';
import '../widgets/tv_shows/tv_shows_listview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _isDefault = true;
  bool _isSearching = false;

  void _toggleDefault(bool togglingStatus) {
    setState(() {
      _isDefault = togglingStatus;
    });
  }

  Future<void> liveSearch(String text, bool isItDefault) async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Movies>(context, listen: false).fetchSearchedMovies(text);
    await Provider.of<TvShows>(context, listen: false)
        .fetchSearchedTvShows(text);
    setState(() {
      _isLoading = false;
      _isDefault = isItDefault;
      _isSearching = true;
    });
  }

  void revert(bool isDefault) {
    setState(() {
      _isDefault = isDefault;
      _isSearching = false;
    });
  }

  @override
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Movies>(context, listen: false)
        .fetchAndSetTopRatedMovies();
    await Provider.of<TvShows>(context, listen: false).fetchAndSetTopTvShows();
    setState(() {
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies and TV Shows'),
        backgroundColor: Colors.blue.shade900,
      ),
      body:
          /*_isLoading
          ? Center(child: CircularProgressIndicator())
          :*/
          Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: ToggleWidget(_toggleDefault), flex: 1),
            Flexible(child: SearchBox(liveSearch, _isDefault, revert), flex: 1),
            if (_isLoading)
              Container(
                  margin: const EdgeInsets.all(40),
                  child: CircularProgressIndicator()),
            if (!_isDefault && !_isSearching && !_isLoading)
              Flexible(child: MoviesListView(), flex: 10),
            if (_isDefault && !_isSearching && !_isLoading)
              Flexible(child: TvShowsListView(), flex: 10),
            if (!_isDefault && _isSearching && !_isLoading)
              Flexible(child: SearchedMoviesListView(), flex: 10),
            if (_isDefault && _isSearching && !_isLoading)
              Flexible(child: SearchedTvShowsListView(), flex: 10),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
