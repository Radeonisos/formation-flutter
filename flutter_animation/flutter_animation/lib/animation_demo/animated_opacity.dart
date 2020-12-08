import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children(),
    );
  }

  List<Widget> children() {
    List<Widget> c = [];
    c.add(Text('Opacité'));
    c.add(AnimatedOpacity(
      opacity: (isOpacity) ? 0 : 1,
      child: Image.asset(Datas().imgFlutter),
      duration: Duration(milliseconds: 500),
    ));
    c.add(FlatButton(
      onPressed: () {
        setState(() {
          isOpacity = !isOpacity;
        });
      },
      child: Text((isOpacity) ? "Montrer" : "Cacher"),
    ));
    return c;
  }
}
