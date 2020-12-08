import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerDemo> {
  Duration _duration = Duration(seconds: 1);
  double min = 0;
  double max = 300;
  double heightValue = 150;
  double widthValue = 150;
  Color _color = Colors.blue;
  bool _shadow = true;
  bool _radius = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        AnimatedContainer(
          height: heightValue,
          width: widthValue,
          duration: _duration,
          curve: Curves.linear,
          decoration: BoxDecoration(
              color: _color,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: (_shadow) ? Offset(3, 0) : Offset(0, 0),
                    spreadRadius: (_shadow) ? 2.5 : 0,
                    blurRadius: (_shadow) ? 3 : 0),
              ],
              borderRadius: (_radius) ? BorderRadius.circular(25) : null),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  colorButton('Bleu', Colors.blue),
                  colorButton('Rouge', Colors.red),
                  colorButton('Vert', Colors.green),
                  colorButton('Jaune', Colors.yellow),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Modif Hauteur : ${heightValue.round()}"),
                  Slider(
                    value: heightValue,
                    max: max,
                    min: min,
                    onChanged: (newValue) {
                      setState(() {
                        heightValue = newValue;
                      });
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Modif Largeur : ${widthValue.round()}"),
                  Slider(
                    value: widthValue,
                    max: max,
                    min: min,
                    onChanged: (newValue) {
                      setState(() {
                        widthValue = newValue;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Shadow : $_shadow'),
                  Switch(
                    value: _shadow,
                    onChanged: (newValue) {
                      setState(() {
                        _shadow = newValue;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Radius : $_radius'),
                  Switch(
                    value: _radius,
                    onChanged: (newValue) {
                      setState(() {
                        _radius = newValue;
                      });
                    },
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  FloatingActionButton colorButton(String name, Color color) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _color = color;
        });
      },
      backgroundColor: color,
      heroTag: name,
    );
  }
}
