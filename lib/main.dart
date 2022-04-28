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
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Category1",
                    style: TextStyle(fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
                onTap: () => itemSelected(context, 0),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Category2",
                    style: TextStyle(fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
                onTap: () => itemSelected(context, 1),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Category3",
                    style: TextStyle(fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
                onTap: () => itemSelected(context, 2),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Category4",
                    style: TextStyle(fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
                onTap: () => itemSelected(context, 3),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Category5",
                    style: TextStyle(fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
                onTap: () => itemSelected(context, 4),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Category6",
                    style: TextStyle(fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15)),
                ),
                onTap: () => itemSelected(context, 5),
              ),
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
