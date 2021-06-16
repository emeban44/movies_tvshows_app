import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/helpers/sharedPrefs.dart';

class SearchBox extends StatefulWidget {
  final Function(String text, bool isItDefault) _liveSearch;
  final bool _isDefault;
  final Function(bool isItDefault) _revert;
  SearchBox(this._liveSearch, this._isDefault, this._revert);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _searchKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  Timer searchOnStoppedTyping;

  _onChangeHandler(value) {
    if (value.length > 2) {
      SharedPrefs().setOverTwoCharacters(true);
      const duration = Duration(seconds: 1);
      if (searchOnStoppedTyping != null) {
        setState(() => searchOnStoppedTyping.cancel()); // clear timer
      }
      if (_searchController.text.length < 3) {
        SharedPrefs().setOverTwoCharacters(false);
      }
      setState(() =>
          searchOnStoppedTyping = new Timer(duration, () => search(value)));
    } else
      SharedPrefs().setOverTwoCharacters(false);
    if (!SharedPrefs().getOverTwoCharactersBool)
      widget._revert(widget._isDefault);
  }

  search(value) {
    if (SharedPrefs().getOverTwoCharactersBool) {
      print('searching...');
      widget._liveSearch(value, widget._isDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15, top: 5),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade300, Colors.blue.shade100],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        key: _searchKey,
        autocorrect: false,
        autofocus: false,
        controller: _searchController,
        onChanged: _onChangeHandler, //widget._liveSearch,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
