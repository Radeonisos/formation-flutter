import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_demo/hero_widget.dart';
import 'package:flutter_animation/models/greek_city.dart';

class HeroDetail extends StatelessWidget {
  final HeroWidget hero;
  final GreekCity greekCity;

  HeroDetail(this.greekCity, this.hero);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[hero, Text(greekCity.description)],
    );
  }
}
