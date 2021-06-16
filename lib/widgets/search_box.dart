import 'dart:async';

import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function(String text) _liveSearch;
  SearchBox(this._liveSearch);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _searchKey = GlobalKey<FormState>();

  Timer searchOnStoppedTyping;

  _onChangeHandler(value) {
    if (value.length > 2) {
      const duration = Duration(seconds: 1);
      if (searchOnStoppedTyping != null) {
        setState(() => searchOnStoppedTyping.cancel()); // clear timer
      }
      setState(() =>
          searchOnStoppedTyping = new Timer(duration, () => search(value)));
    }
  }

  search(value) {
    print(value);
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
