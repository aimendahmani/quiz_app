import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final score;
  Function q;
  Result(this.q, this.score);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Done! your score is $score",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          ElevatedButton.icon(
            onPressed: () {
              q();
            },
            icon: Icon(Icons.restart_alt_outlined),
            label: Text(
              "Restart",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyApp()));
            },
            icon: Icon(
              Icons.home_outlined,
              color: Colors.blue,
            ),
            label: Text(
              "Home",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
