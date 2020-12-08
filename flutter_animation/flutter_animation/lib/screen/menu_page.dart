import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_demo/animated_menu.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.orange,
      child: AnimatedMenu(),
    );
  }
}
