import 'package:flutter/material.dart';

class RatingsRow extends StatelessWidget {
  final int totalVotes;
  final double votesAverage;
  RatingsRow(this.totalVotes, this.votesAverage);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.blue, width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: TextButton.icon(
              icon: Icon(
                Icons.star,
                color: Colors.blue.shade900,
                size: 35,
              ),
              label: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Text(
                  votesAverage.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              onPressed: null,
            ),
          ),
          Flexible(
            child: Text(
              totalVotes.toString() + ' votes',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
