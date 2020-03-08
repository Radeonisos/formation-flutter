import 'package:flutter/material.dart';
import 'package:flutter_first_app/quizz.dart';
import 'package:flutter_first_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "Quel est ta couleur préferée?",
      'answers': [
        {'text': 'Noir', 'score': 10},
        {'text': 'Rouge', 'score': 5},
        {'text': 'Vert', 'score': 3},
        {'text': 'Blanc', 'score': 1}
      ]
    },
    {
      'questionText': "Quel est ton animal fétiche?",
      'answers': [
        {'text': 'Elephant', 'score': 10},
        {'text': 'Chien', 'score': 5},
        {'text': 'Chat', 'score': 3},
        {'text': 'Tigre', 'score': 1}
      ]
    },
    {
      'questionText': "Quel est ton plat préfére?",
      'answers': [
        {'text': 'Pâtes', 'score': 10},
        {'text': 'Magret de canard', 'score': 5},
        {'text': 'Chat', 'score': 1}
      ]
    }
  ];
  var _index = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _index = _index + 1;
    });
    _totalScore += score;
  }

  void _resetQuizz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mon quizz!"),
        ),
        body: (_index < _questions.length)
            ? Quizz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _index)
            : Result(_totalScore, _resetQuizz),
      ),
    );
  }
}
