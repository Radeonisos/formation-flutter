import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';

class AnimationListenerDemo extends StatefulWidget {
  @override
  _AnimationListenerDemoState createState() => _AnimationListenerDemoState();
}

class _AnimationListenerDemoState extends State<AnimationListenerDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Duration _duration = Duration(seconds: 2);
  Animation<double> _animation;
  bool opacity = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animation = Tween<double>(begin: -0.2, end: 0.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.elasticIn))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            opacity = true;
          });
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
          setState(() {
            opacity = false;
          });
        }
      });
    /*
      ..addListener(() {
        print(_animationController.value);
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else if (_animationController.isDismissed) {
          _animationController.forward();
        }
      });*/
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: AnimatedOpacity(
        child: Image.asset(Datas().imgFlutter),
        duration: Duration(milliseconds: 2500),
        opacity: (opacity) ? 0.2 : 1,
      ),
    );
  }
}
