import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/category.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

void itemSelected(BuildContext ctx, int n) {
  Navigator.of(ctx).push(MaterialPageRoute(
    builder: (ctx) {
      return Category(n);
    },
  ));
}

class _MyAppState extends State<MyApp> {
  var categories = [
    "Technologie",
    "Science",
    "Movies",
    "Cars",
    "Sport",
    "Gepgraphy"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: [
              ...(categories)
                  .map(
                    (e) => ElevatedButton(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              e,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                0.5,
                                0.9,
                              ],
                              colors: [
                                Colors.blue,
                                Color.fromARGB(200, 54, 197, 244),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () =>
                          itemSelected(context, categories.indexOf(e)),
                    ),
                  )
                  .toList(),
            ],
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
            ),
          ),
        ),
      ),
    );
  }
}
