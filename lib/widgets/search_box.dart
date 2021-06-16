import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final _searchKey = GlobalKey<FormState>();
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
