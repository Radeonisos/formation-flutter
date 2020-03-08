import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function selectHandler;

  Answer(this.text, this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(text),
        onPressed: selectHandler,
      ),
    );
  }
}
