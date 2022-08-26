import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/result.dart';
import 'result.dart';

// void main() => runApp(MyApp());
int maxSeconds = 30;
int seconds = maxSeconds;
Timer? timer;

class Category extends StatefulWidget {
  int indexCategory;
  Category(this.indexCategory);

  @override
  State<Category> createState() => _CategoryState(indexCategory);
}

class _CategoryState extends State<Category> {
  int indexCategory;
  _CategoryState(this.indexCategory);
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer?.cancel();
        setState(() {
          indexQuestion = 100;
        });
      }
    });
  }

  void initState() {
    restartApp();

    super.initState();
  }

  final List<Map<String, Object>> quizList = [
    {
      "category": "Technology",
      "quiz": [
        {
          "question":
              "What year was the very first model of the iPhone released?",
          "suggestions": [
            {"suggest": "2005", "score": "0"},
            {"suggest": "2007", "score": "1"},
            {"suggest": "2008", "score": "0"},
            {"suggest": "2010", "score": "0"},
          ],
        },
        {
          "question":
              "What’s the shortcut for the “copy” function on most computers?",
          "suggestions": [
            {"suggest": "Ctrl z", "score": "0"},
            {"suggest": "Ctrl x", "score": "0"},
            {"suggest": "Ctrl c", "score": "1"},
            {"suggest": "Ctrl r", "score": "0"},
          ],
        },
        {
          "question": "What is often seen as the smallest unit of memory?",
          "suggestions": [
            {"suggest": "Kilobyte", "score": "1"},
            {"suggest": "Megabyte", "score": "0"},
            {"suggest": "Gigabyte", "score": "0"},
            {"suggest": "Terabyte", "score": "0"},
          ],
        },
      ],
    }, //category 1

    {
      "category": "Science",
      "quiz": [
        {
          "question": "Who was the first woman to win a Nobel Prize (in 1903)?",
          "suggestions": [
            {"suggest": "Lise Meitner", "score": "0"},
            {"suggest": "Alice Ball", "score": "0"},
            {"suggest": "Helen Taussig", "score": "0"},
            {"suggest": "Marie Curie", "score": "1"},
          ],
        },
        {
          "question": "What part of the atom has no electric charge?",
          "suggestions": [
            {"suggest": "Electron", "score": "0"},
            {"suggest": "Neutron", "score": "1"},
            {"suggest": "Proton", "score": "0"},
          ],
        },
        {
          "question": "Which planet has the most gravity?",
          "suggestions": [
            {"suggest": "Jupiter", "score": "1"},
            {"suggest": "Venus", "score": "0"},
            {"suggest": "Mars", "score": "0"},
            {"suggest": "Earth", "score": "0"},
          ],
        },
      ],
    }, //category2

    {
      "category": "Movie",
      "quiz": [
        {
          "question": "How many films did Sean Connery play James Bond in?",
          "suggestions": [
            {"suggest": "Four", "score": "0"},
            {"suggest": "Six", "score": "0"},
            {"suggest": "Seven", "score": "1"},
            {"suggest": "Eight", "score": "0"},
          ],
        },
        {
          "question": "Which Indiana Jones movie was released back in 1984?",
          "suggestions": [
            {"suggest": "Raiders of the Lost Ark ", "score": "0"},
            {"suggest": "Indiana Jones and the Temple of Doom ", "score": "1"},
            {"suggest": "Indiana Jones and the Last Crusade", "score": "0"},
            {
              "suggest": "Indiana Jones and the Kingdom of the Crystal Skull",
              "score": "0"
            },
          ],
        },
        {
          "question":
              "What was the name of the actor who played Jack Dawson in Titanic?",
          "suggestions": [
            {"suggest": "Nicholas Cage", "score": "1"},
            {"suggest": "Brad Pitt", "score": "0"},
            {"suggest": "Johnny Depp", "score": "0"},
            {"suggest": "Leonardo DiCaprio", "score": "1"},
          ],
        },
      ],
    }, // category3

    {
      "category": "Cars",
      "quiz": [
        {
          "question": "Which animal can be seen on the Porsche logo?",
          "suggestions": [
            {"suggest": "Lion", "score": "0"},
            {"suggest": "Horse", "score": "1"},
            {"suggest": "Jaguar", "score": "0"},
            {"suggest": "Bull", "score": "0"},
          ],
        },
        {
          "question":
              "Who is often credited with creating the world’s first car?",
          "suggestions": [
            {"suggest": "Oma Honda", "score": "0"},
            {"suggest": "Karl Benz", "score": "1"},
            {"suggest": "Fiat Chrysler", "score": "0"},
            {"suggest": "Harrison Ford", "score": "0"},
          ],
        },
        {
          "question": "In what year was the Corvette introduced?",
          "suggestions": [
            {"suggest": "1953", "score": "1"},
            {"suggest": "1956", "score": "0"},
            {"suggest": "1958", "score": "0"},
            {"suggest": "1960", "score": "0"},
          ],
        },
      ],
    }, // category4

    {
      "category": "Sport",
      "quiz": [
        {
          "question":
              "How many soccer players should each team have on the field at the start of each match?",
          "suggestions": [
            {"suggest": "10", "score": "0"},
            {"suggest": "12", "score": "0"},
            {"suggest": "11", "score": "1"},
            {"suggest": "9", "score": "0"},
          ],
        },
        {
          "question":
              "When Michael Jordan played for the Chicago Bulls, how many NBA Championships did he win?",
          "suggestions": [
            {"suggest": "Four", "score": "0"},
            {"suggest": "Six", "score": "1"},
            {"suggest": "Three", "score": "0"},
            {"suggest": "Two", "score": "0"},
          ],
        },
        {
          "question": "What country won the very first FIFA World Cup in 1930?",
          "suggestions": [
            {"suggest": "Uruguay", "score": "1"},
            {"suggest": "Brazil", "score": "0"},
            {"suggest": "Yugoslavia", "score": "0"},
            {"suggest": "Argentina", "score": "0"},
          ],
        },
      ],
    }, // category 5

    {
      "category": "Geography",
      "quiz": [
        {
          "question": "Which American state is the largest (by area)?",
          "suggestions": [
            {"suggest": "Florida", "score": "0"},
            {"suggest": "California", "score": "0"},
            {"suggest": "Alaska", "score": "1"},
            {"suggest": "Texas", "score": "0"},
          ],
        },
        {
          "question":
              "Which two countries share the longest international border?",
          "suggestions": [
            {"suggest": "USA and Mexico", "score": "0"},
            {"suggest": "Canada and the USA", "score": "1"},
            {"suggest": "Russia and China", "score": "0"},
            {"suggest": "Argentina and Chile", "score": "0"},
          ],
        },
        {
          "question": "What is the name of the world’s longest river?",
          "suggestions": [
            {"suggest": "Amazon River", "score": "0"},
            {"suggest": "Mississippi/Missouri ", "score": "0"},
            {"suggest": "Nile River", "score": "1"},
            {"suggest": "Yangtze River", "score": "0"},
          ],
        },
      ],
    }, // category6
  ];

  int indexQuestion = 0;
  int totalScore = 0;
  void incrementIndex(int score) {
    setState(() {
      indexQuestion += 1;
      totalScore += score;
      seconds = maxSeconds;
    });
  }

  void restartApp() {
    setState(() {
      indexQuestion = 0;
      totalScore = 0;
      seconds = maxSeconds;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          leading: Container(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(MaterialPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                ));
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
        body: indexQuestion <
                (quizList[indexCategory]["quiz"] as List<Map<String, Object>>)
                    .length
            ? ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Question : ${indexQuestion + 1}/${(quizList[indexCategory]['quiz'] as List<Map<String, Object>>).length}",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Text(
                        "Score : $totalScore",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                    ],
                  ),
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
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ElevatedButton(
                              child: Text(
                                item["suggest"].toString(),
                                style: TextStyle(fontSize: 24),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              ),
                              onPressed: () {
                                incrementIndex(
                                    int.parse(item["score"].toString()));

                                print(
                                    'index : $indexQuestion  score : ${int.parse(item["score"].toString())}');
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(30),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CircularProgressIndicator(
                                value: seconds / maxSeconds,
                                strokeWidth: 4,
                              ),
                              Center(
                                child: Text(
                                  "$seconds",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Result(restartApp, totalScore),
      ),
    );
  }
}
