import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //lets animate our progress bar
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;
  late PageController _pageController;
  PageController get pageController => this._pageController;

  bool _inAnswered = false;
  bool get isAnswered => this._inAnswered;

  late String _correctAnswer;
  String get correctAnswer => this._correctAnswer;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        //apdate like setstate
        update();
      });
    //start the animation
    _pageController = PageController();
    _animationController.forward().whenComplete(nextQuestion);

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _inAnswered = true;
    _correctAnswer = question.correctAnswer;
    _selectedAns = selectedIndex;
    if (question.options[selectedIndex] == _correctAnswer) {
      _numOfCorrectAns++;
      print(_numOfCorrectAns);
    }
    _animationController.stop();
    update();
    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value < 5) {
      _inAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
