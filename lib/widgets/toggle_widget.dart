import 'package:flutter/material.dart';
import 'package:movies_tvshows_app/widgets/toggle_item.dart';

class ToggleWidget extends StatefulWidget {
  final Function toggling;
  ToggleWidget(this.toggling);
  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  final _selection = [false, true];
  void _toggleView(String title) {
    setState(() {
      _selection[0] = !_selection[0];
      _selection[1] = !_selection[1];
    });
    widget.toggling(_selection[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 50,
      //  margin: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: ToggleItem('Movies', _toggleView, _selection[0]),
            onTap: _selection[0] ? null : () => _toggleView('Movies'),
          ),
          GestureDetector(
            child: ToggleItem('TV Shows', _toggleView, _selection[1]),
            onTap: _selection[1] ? null : () => _toggleView('TV Shows'),
          ),
        ],
      ),
    );
  }
}
