import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import 'result.dart';

// void main() => runApp(MyApp());

class Category extends StatefulWidget {
  int indexCategory;
  Category(this.indexCategory);
  @override
  State<Category> createState() => _CategoryState(indexCategory);
}

class _CategoryState extends State<Category> {
  int indexCategory;
  _CategoryState(this.indexCategory);
  final List<Map<String, Object>> quizList = [
    {
      "category": "categor1",
      "quiz": [
        {
          "question": "What's your favorite color 1?",
          "suggestions": [
            {"suggest": "blue 1", "score": "10"},
            {"suggest": "red", "score": "20"},
            {"suggest": "ping", "score": "30"},
            {"suggest": "black", "score": "40"},
          ],
        },
        {
          "question": "What's your favorite color 2?",
          "suggestions": [
            {"suggest": "blue 2", "score": "10"},
            {"suggest": "red", "score": "20"},
            {"suggest": "ping", "score": "30"},
            {"suggest": "black", "score": "40"},
          ],
        },
        {
          "question": "What's your favorite color 3?",
          "suggestions": [
            {"suggest": "blue 3", "score": "10"},
            {"suggest": "red", "score": "20"},
            {"suggest": "ping", "score": "30"},
            {"suggest": "black", "score": "40"},
          ],
        },
      ],
    }, //category 1

    {
      "category": "categor2",
      "quiz": [
        {
          "question": "What's your favorite animal 1?",
          "suggestions": [
            {"suggest": "lion 1", "score": "10"},
            {"suggest": "shark", "score": "20"},
            {"suggest": "panther", "score": "30"},
            {"suggest": "eagle", "score": "40"},
          ],
        },
        {
          "question": "What's your favorite animal 2?",
          "suggestions": [
            {"suggest": "lion 2", "score": "10"},
            {"suggest": "shark", "score": "20"},
            {"suggest": "panther", "score": "30"},
            {"suggest": "eagle", "score": "40"},
          ],
        },
        {
          "question": "What's your favorite animal 3?",
          "suggestions": [
            {"suggest": "lion 3", "score": "10"},
            {"suggest": "shark", "score": "20"},
            {"suggest": "panther", "score": "30"},
            {"suggest": "eagle", "score": "40"},
          ],
        },
      ],
    },
  ];

  int indexQuestion = 0;
  int totalScore = 0;
  void incrementIndex(int score) {
    setState(() {
      indexQuestion += 1;
      totalScore += score;
    });
  }

  void restartApp() {
    setState(() {
      indexQuestion = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: indexQuestion <
                (quizList[indexCategory]["quiz"] as List<Map<String, Object>>)
                    .length
            ? ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text(
                      (quizList[indexCategory]["quiz"]
                                  as List<Map<String, Object>>)[indexQuestion]
                              ["question"]
                          .toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  ...((quizList[indexCategory]["quiz"]
                              as List<Map<String, Object>>)[indexQuestion]
                          ["suggestions"] as List<Map<String, Object>>)
                      .map(
                        (item) => Material(
                          child: InkWell(
                            focusColor: Colors.blue.shade50,
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                item["suggest"].toString(),
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            onTap: () {
                              incrementIndex(
                                  int.parse(item["score"].toString()));
                              print(
                                  'index : $indexQuestion  score : ${int.parse(item["score"].toString())}');
                            },
                          ),
                        ),
                      )
                      .toList()
                ],
              )
            : Result(restartApp, totalScore),
      ),
    );
  }
}
