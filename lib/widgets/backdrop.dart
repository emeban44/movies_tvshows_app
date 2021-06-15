import 'package:flutter/material.dart';

class BackdropImage extends StatelessWidget {
  final String path;
  BackdropImage(this.path);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Image.network(
        path,
      ),
    );
  }
}
