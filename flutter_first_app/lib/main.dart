import 'package:flutter/material.dart';
import 'package:flutter_first_app/questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;

  void _answerQuestion() {
    print("Answer chosen!");
    setState(() {
      if (_index < 1) _index = _index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "Quel est ta couleur préferée?",
      "Quel est ton animal fétiche?"
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(questions[_index]),
            RaisedButton(
              child: Text("Réponse 1"),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text("Réponse 2"),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text("Réponse 3"),
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
