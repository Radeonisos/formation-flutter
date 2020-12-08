import 'package:flutter/material.dart';

class AnimatedSizeDemo extends StatefulWidget {
  @override
  _AnimatedSizeDemoState createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo>
    with SingleTickerProviderStateMixin {
  bool isBig = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          vsync: this,
          child: Container(
            height: (isBig) ? 300 : 150,
            width: (isBig) ? 300 : 150,
            color: Colors.blue,
          ),
        ),
        onTap: () {
          setState(() {
            isBig = !isBig;
          });
        },
      ),
    );
  }
}
