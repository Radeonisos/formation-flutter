import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuizz;

  Result(this.resultScore, this.resetQuizz);

  String get resultPhrase {
    var resultText = 'Test fini !';
    if (resultScore <= 8) {
      resultText = "Tu es innocent";
    } else if (resultScore <= 12) {
      resultText = "Tu es gentil";
    } else if (resultScore <= 16) {
      resultText = "Tu es bizarre";
    } else {
      resultText = "Tu es le diable!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text("Recommencer le quizz"),
          onPressed: resetQuizz,
          textColor: Colors.blue,
        )
      ],
    ));
  }
}
