import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/components/option.dart';
import 'package:quiz_app/consts.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class QuestionQard extends StatelessWidget {
  final Question question;
  const QuestionQard({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return BlurryContainer(
      blur: 5,
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "${question.question}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              ...List.generate(
                question.options.length,
                (index) => option(
                    text: question.options[index],
                    index: index,
                    question: question,
                    press: () {
                      controller.checkAns(question, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
