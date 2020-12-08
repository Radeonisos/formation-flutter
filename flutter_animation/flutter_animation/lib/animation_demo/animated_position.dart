import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';

class AnimatedPositionDemo extends StatefulWidget {
  @override
  _AnimatedPositionDemoState createState() => _AnimatedPositionDemoState();
}

class _AnimatedPositionDemoState extends State<AnimatedPositionDemo> {
  bool isConnected = false;

  Duration duration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double max = size.width * 0.8;
    double centerTop = max / 2 - 20;
    double centerBottom = max / 2 - 20;

    return Center(
      child: Container(
        height: max,
        width: max,
        child: Card(
          elevation: 8,
          child: InkWell(
            onTap: () {
              setState(() {
                isConnected = !isConnected;
              });
            },
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Entrez mail",
                    ),
                  ),
                  left: 10,
                  right: 10,
                  top: centerTop,
                  bottom: centerBottom,
                  duration: duration,
                ),
                AnimatedPositioned(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Entrez mdp",
                    ),
                  ),
                  left: 10,
                  right: 10,
                  bottom: (isConnected) ? centerBottom : 10,
                  top: (isConnected) ? centerTop : max - 40,
                  duration: duration,
                ),
                AnimatedPositioned(
                  top: (isConnected) ? 0 : 10,
                  bottom: (isConnected) ? 0 : max - 100,
                  left: (isConnected) ? 0 : 10,
                  right: (isConnected) ? 0 : max - 100,
                  duration: duration,
                  child: AnimatedContainer(
                    duration: duration,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            BorderRadius.circular((isConnected) ? 0 : 50)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Datas().imgFlutter,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
