import 'package:flutter/material.dart';
import 'dart:math';

//enum difficulty {easy,meduim,hard}
class Question {
  final String id;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> options;

  Question({
    required this.id,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsList = json['incorrectAnswers'];
    return Question(
      id: json['id'],
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correctAnswer'],
      //options: json['incorrectAnswers'] as List<String>,
      options: new List<String>.from(optionsList),
    );
  }
  void update() {
    options.insert(Random().nextInt(4), correctAnswer);
  }
}

enum Difficulty { easy, meduim, hard }
