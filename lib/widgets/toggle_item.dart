import 'package:flutter/material.dart';

class ToggleItem extends StatelessWidget {
  final String title;
  final Function toggleView;
  final bool isSelected;
  ToggleItem(this.title, this.toggleView, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.blue,
                  Colors.blueGrey,
                ],
              )
            : null,
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: title == 'Movies'
            ? BorderRadius.only(
                topLeft: Radius.circular(7.5),
                bottomLeft: Radius.circular(7.5),
              )
            : BorderRadius.only(
                topRight: Radius.circular(7.5),
                bottomRight: Radius.circular(7.5),
              ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.grey.shade100 : Colors.black,
          ),
        ),
      ),
    );
  }
}
