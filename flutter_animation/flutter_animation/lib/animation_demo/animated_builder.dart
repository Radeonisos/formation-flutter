import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Image _image = Image.asset(Datas().imgFlutter);
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _scale = Tween<double>(begin: 0, end: 4).animate(
        CurvedAnimation(parent: _animationController, curve: Curves?.linear));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        child: _image,
        builder: (ctx, child) {
          return Transform.scale(
            scale: _scale.value,
            child: child,
          );
          /* return Transform.rotate(
            angle: _animationController.value * 2 * math.pi,
            child: child,
          );*/
        },
      ),
    );
  }
}
