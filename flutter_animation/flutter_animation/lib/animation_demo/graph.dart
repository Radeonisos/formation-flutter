import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animation/models/exercices.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<Exercices> _exercices = [
    Exercices(0),
    Exercices(1),
    Exercices(2),
    Exercices(3),
  ];
  int currentWeek = 0;

  @override
  Widget build(BuildContext context) {
    double max = MediaQuery.of(context).size.width * 0.9;

    return Column(
      children: <Widget>[
        Text('Semaine numéro ${currentWeek + 1}'),
        Container(
          height: max,
          width: max,
          child: Card(
            child: charts(max, _exercices[currentWeek]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Text('Précédent'),
              onPressed: () {
                setState(() {
                  if (currentWeek > 0) {
                    currentWeek -= 1;
                  }
                });
              },
            ),
            FlatButton(
              child: Text('Suivant'),
              onPressed: () {
                setState(() {
                  if (currentWeek < _exercices.length - 1) {
                    currentWeek += 1;
                  }
                });
              },
            )
          ],
        )
      ],
    );
  }

  Row charts(double max, Exercices exercices) {
    double width = max / 10;
    int maxRun = exercices.runs.reduce(math.max);
    double ratio = max / maxRun;

    List<AnimatedContainer> containers = [];
    exercices.runs.forEach((run) {
      Color color = getColor(run, maxRun);
      containers.add(container(width, ratio * run, run, color));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: containers,
    );
  }

  Color getColor(int value, int max) {
    if ((max * 0.75) < value) {
      return Colors.green;
    } else if ((max * 0.5) < value) {
      return Colors.yellow;
    } else if ((max * 0.25) < value) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  AnimatedContainer container(
      double width, double height, int value, Color color) {
    return AnimatedContainer(
      width: width,
      height: height,
      color: color,
      duration: Duration(seconds: 1),
      curve: Curves.linear,
      child: Center(
        child: Text(value.toString()),
      ),
    );
  }
}
