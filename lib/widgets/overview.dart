import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final String overview;
  Overview(this.overview);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          overview,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 17),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
    );
  }
}
