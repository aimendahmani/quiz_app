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

  final leadingAvatar = [
    {
      'letter': 'a',
      'color': Colors.amber,
    },
    {
      'letter': 'b',
      'color': Color.fromARGB(255, 120, 205, 255),
    },
    {
      'letter': 'c',
      'color': Color.fromARGB(255, 247, 67, 187),
    },
    {
      'letter': 'd',
      'color': Color.fromARGB(255, 120, 255, 156),
    },
  ];
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
  int indexsuggest = -1;
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
          backgroundColor: Color(0xff0d77a0),
          title: Text('Quiz App'),
          centerTitle: true,
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
        body: Container(
          color: Color.fromARGB(255, 48, 222, 243),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: indexQuestion <
                    (quizList[indexCategory]["quiz"]
                            as List<Map<String, Object>>)
                        .length
                ? ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Question : ${indexQuestion + 1}/${(quizList[indexCategory]['quiz'] as List<Map<String, Object>>).length}",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            Text(
                              "Score : $totalScore",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CircularProgressIndicator(
                                          value: seconds / maxSeconds,
                                          strokeWidth: 4,
                                          color: Color(0xff0d77a0),
                                          backgroundColor: Colors.white,
                                        ),
                                        Center(
                                          child: Text(
                                            "$seconds",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Color(0xff0d77a0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            (quizList[indexCategory]["quiz"] as List<
                                        Map<String, Object>>)[indexQuestion]
                                    ["question"]
                                .toString(),
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      ...((quizList[indexCategory]["quiz"]
                                  as List<Map<String, Object>>)[indexQuestion]
                              ["suggestions"] as List<Map<String, Object>>)
                          .map(
                        (item) {
                          if (indexsuggest >= 3)
                            indexsuggest = 0;
                          else
                            indexsuggest++;
                          return Material(
                            color: Color.fromARGB(255, 48, 222, 243),
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  overlayColor: int.parse(
                                              item["score"].toString()) ==
                                          0
                                      ? MaterialStateProperty.all(Colors.red)
                                      : MaterialStateProperty.all(Colors.green),
                                  animationDuration:
                                      Duration(milliseconds: 500),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: leadingAvatar[indexsuggest]
                                        ['color'] as Color,
                                    child: Text(
                                      leadingAvatar[indexsuggest]['letter']
                                          as String,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 60.0),
                                    child: Text(
                                      item["suggest"].toString(),
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Timer(Duration(milliseconds: 500), () {
                                    incrementIndex(
                                        int.parse(item["score"].toString()));

                                    print(
                                        'index : $indexQuestion  score : ${int.parse(item["score"].toString())}');
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ],
                  )
                : Result(restartApp, totalScore),
          ),
        ),
      ),
    );
  }
}
