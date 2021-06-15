import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/widgets/toggle_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies and TV Shows'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ToggleWidget(),
            ],
          ),
        ));
  }
}
