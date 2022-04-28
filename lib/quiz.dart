import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  int index;
  Quiz(this.index);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: Text("$index"),
      ),
    );
  }
}
