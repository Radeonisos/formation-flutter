import 'package:flutter/material.dart';
import 'package:flutter_first_app/answer.dart';
import 'package:flutter_first_app/questions.dart';

class Quizz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quizz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'], () => answerQuestion(answer['score']));
        }).toList(),
      ],
    );
  }
}
