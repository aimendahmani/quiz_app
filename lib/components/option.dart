import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/consts.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/models/question.dart';

class option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;
  final Question question;
  const option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (question.options[index] == qnController.correctAnswer) {
                return klGreenColor;
              } else if (index == qnController.selectedAns &&
                  question.options[qnController.selectedAns] !=
                      qnController.correctAnswer) {
                return kRedColor;
              }
            }
            return kgrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "$text",
                        style: TextStyle(color: getTheRightColor()),
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: getTheRightColor() == kgrayColor
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRightColor()),
                      ),
                      child: getTheRightColor() == kgrayColor
                          ? null
                          : Icon(getTheRightIcon(), size: 16),
                    ),
                  ]),
            ),
          );
        });
  }
}
