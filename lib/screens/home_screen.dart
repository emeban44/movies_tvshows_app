import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/providers/movies_provider.dart';
import 'package:movies_tvshows_app/widgets/toggle_widget.dart';
import 'package:provider/provider.dart';

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
              Container(
                child: ElevatedButton(
                  child: Text('TEST API'),
                  onPressed: () {
                    Provider.of<Movies>(context, listen: false).testApi();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
