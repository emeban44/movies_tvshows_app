import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies and TV Shows'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
