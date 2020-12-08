import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';
import 'package:vector_math/vector_math.dart' show radians;

class AnimatedMenu extends StatefulWidget {
  @override
  _AnimatedMenuState createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Duration _duration = Duration(milliseconds: 250);
  Animation<double> _scale;
  Animation<double> _move;
  Animation<double> _rotation;

  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
    _scale = Tween<double>(begin: 1, end: 0).animate(_curvedAnimation);
    _move = Tween<double>(begin: 0, end: 70).animate(_curvedAnimation);
    _rotation = Tween<double>(begin: math.pi, end: math.pi * 2)
        .animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (ctx, builder) {
          return Transform.rotate(angle: _rotation.value, child: stack());
        });
  }

  Stack stack() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        menuChoice(Icons.opacity, Colors.red, '0', closeMenu, 0),
        menuChoice(Icons.directions_run, Colors.green, '1', closeMenu, 90),
        menuChoice(Icons.queue_play_next, Colors.amber, '2', closeMenu, 180),
        menuChoice(Icons.verified_user, Colors.deepPurple, '3', closeMenu, 270),
        Transform.scale(
          scale: _scale.value - 1,
          child: fab(Icons.close, Colors.grey, 'Close', closeMenu),
        ),
        Transform.scale(
          scale: _scale.value,
          child: fab(Icons.menu, Colors.blue, 'Open', openMenu),
        )
      ],
    );
  }

  FloatingActionButton fab(
      IconData icon, Color color, String tag, VoidCallback onPressed) {
    return FloatingActionButton(
        child: Icon(icon),
        onPressed: onPressed,
        backgroundColor: color,
        heroTag: tag);
  }

  FloatingActionButton menuFab(IconData icon, Color color, String tag) {
    return FloatingActionButton(
        child: Icon(icon),
        onPressed: () {
          menuSelected(color);
        },
        backgroundColor: color,
        heroTag: tag);
  }

  menuChoice(IconData icon, Color color, String tag, VoidCallback onPressed,
      double angle) {
    double radian = radians(angle);
    double x = (_move.value) * math.cos(radian);
    double y = (_move.value) * math.sin(radian);
    return Transform(
      transform: Matrix4.identity()..translate(x, y),
      child: menuFab(icon, color, tag),
    );
  }

  openMenu() {
    _animationController.forward();
  }

  closeMenu() {
    _animationController.reverse();
  }

  menuSelected(Color color) {
    closeMenu();
    Datas().pusher(
        context,
        color.toString(),
        Container(
          color: color,
        ));
  }
}
