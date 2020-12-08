import 'package:flutter/material.dart';

class AnimatedTextStyleDemo extends StatefulWidget {
  @override
  _AnimatedTextStyleDemoState createState() => _AnimatedTextStyleDemoState();
}

class _AnimatedTextStyleDemoState extends State<AnimatedTextStyleDemo> {
  bool switchStyle = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            switchStyle = !switchStyle;
          });
        },
        child: AnimatedDefaultTextStyle(
          child: Text('Tap to change'),
          style: (switchStyle)
              ? TextStyle(color: Colors.orange, fontSize: 20)
              : TextStyle(color: Colors.green, fontSize: 30),
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
