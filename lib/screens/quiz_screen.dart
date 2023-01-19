import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/components/progress_bar.dart';
import 'package:quiz_app/components/question_card.dart';
import 'package:quiz_app/consts.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class QuizScreen extends StatefulWidget {
  final String categorie;
  final String difficulty;
  const QuizScreen(
      {Key? key, required this.categorie, required this.difficulty})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionController _questionController = Get.put(QuestionController());
  Future<List<Question>> fetchData() async {
    final http.Response res = await http.get(Uri.parse(
        "https://the-trivia-api.com/api/questions?categories=${widget.categorie}&difficulty=${widget.difficulty}&limit=5"));
    if (res.statusCode == 200) {
      var jsonresponse = convert.json.decode(res.body);
      List<Question> QuizData = [];
      for (var singleQuestion in jsonresponse) {
        //Adding Question to the list.
        print("###############################################");
        print(singleQuestion);
        var qst = Question.fromJson(singleQuestion);
        qst.update();
        QuizData.add(qst);
      }

      return QuizData;
    } else {
      print("############### error has occured ##############");
      throw Exception(Error);
    }
  }

  late Future<List<Question>> QuestionData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QuestionData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = QuestionController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            questionController.onClose();
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          TextButton(
            onPressed: () {
              questionController.nextQuestion();
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
      body: Stack(children: [
        WebsafeSvg.asset("assets/icons/bg.svg",
            fit: BoxFit.fill, width: double.infinity, height: double.infinity),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBar(),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                GetX<QuestionController>(
                    init: QuestionController(),
                    builder: (value) {
                      return Text.rich(
                        TextSpan(
                            text: "Question ${value.questionNumber}",
                            style:
                                TextStyle(fontSize: 20, color: kSecondaryColor),
                            children: [
                              TextSpan(
                                  text: "/5",
                                  style: TextStyle(
                                      fontSize: 16, color: kSecondaryColor))
                            ]),
                      );
                    }),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Expanded(
                    child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: 5,
                  itemBuilder: (context, index) => FutureBuilder(
                    future: QuestionData,
                    builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(
                          '${snapshot.error}',
                          style: TextStyle(color: Colors.black),
                        );
                      } else {
                        return QuestionQard(question: snapshot.data[index]);
                      }
                    },
                  ),
                ))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
