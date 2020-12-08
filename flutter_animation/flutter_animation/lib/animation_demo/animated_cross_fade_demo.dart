import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool cross = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: AnimatedCrossFade(
          firstChild: Image.asset(Datas().imgFlutter),
          secondChild: Text('Retour à image'),
          crossFadeState:
              (cross) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 500),
        ),
        onTap: () {
          setState(() {
            cross = !cross;
          });
        },
      ),
    );
  }
}
