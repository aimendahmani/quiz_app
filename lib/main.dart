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
    "Geography"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
          backgroundColor: Color(0xff0d77a0),
          elevation: 0,
        ),
        body: Container(
          color: Color.fromARGB(255, 48, 222, 243),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView(
              children: [
                ...(categories)
                    .map(
                      (e) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background
                          onPrimary: Colors.white,
                          side: BorderSide(
                            color: Colors.yellow,
                            width: 4,
                          ), // foreground
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/' + e + '.gif',
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [
                                      0.2,
                                      0.9,
                                    ],
                                    colors: [
                                      Colors.pink,
                                      Color.fromARGB(200, 54, 197, 244),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () =>
                            itemSelected(context, categories.indexOf(e)),
                      ),
                    )
                    .toList(),
              ],
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
