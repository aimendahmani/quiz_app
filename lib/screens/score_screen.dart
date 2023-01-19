import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/consts.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/controller/user_controller.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.offAll(HomeScreen());
            },
            icon: Icon(
              Icons.home_rounded,
              size: 50,
              color: kdGreenColor,
            )),
      ),
      body: GetBuilder<UserController>(
          init: UserController(),
          builder: (value) {
            return Stack(fit: StackFit.expand, children: [
              _qnController.numOfCorrectAns > 3
                  ? Image.asset("assets/icons/welldone.png")
                  : Image.asset("assets/icons/tryhard.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _qnController.numOfCorrectAns > 3
                      ? Text(
                          "Congratulation! ${value.getUsername()}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        )
                      : Text(
                          "Try hard next time ${value.getUsername()}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Your Score is : ${_qnController.numOfCorrectAns}/${5}",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                ],
              )
            ]);
          }),
    );
  }
}
