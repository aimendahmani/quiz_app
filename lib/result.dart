import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final score;
  Function q;
  Result(this.q, this.score);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Done! your score is $score",
            style: TextStyle(fontSize: 25, color: Colors.blue),
          ),
          ElevatedButton(
            onPressed: () {
              q();
            },
            child: Text("restart!"),
          )
        ],
      ),
    );
  }
}
