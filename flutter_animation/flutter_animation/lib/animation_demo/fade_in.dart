import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';

class FadeIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage(
        fadeInCurve: Curves.linear,
        fadeInDuration: Duration(seconds: 1),
        placeholder: AssetImage(Datas().imgFlutter),
        image: NetworkImage(
            'https://image.jeuxvideo.com/medias-md/159490/1594903140-1871-card.png'),
      ),
    );
  }
}
