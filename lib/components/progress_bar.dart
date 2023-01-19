import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/consts.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff3f4768), width: 3),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(children: [
              //layoutbuilder provide us the available space for the container
              //contraints.maxwidth needed for the animation
              LayoutBuilder(builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              }),
              Positioned.fill(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${((controller.animation.value) * 60).round()} secs"),
                    WebsafeSvg.asset("assets/icons/clock.svg"),
                  ],
                ),
              ))
            ]);
          }),
    );
  }
}
