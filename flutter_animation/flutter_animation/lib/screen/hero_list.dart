import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_demo/hero_widget.dart';
import 'package:flutter_animation/models/datas.dart';
import 'package:flutter_animation/models/greek_city.dart';
import 'package:flutter_animation/screen/hero_detail.dart';

class HeroList extends StatelessWidget {
  List<GreekCity> _cities = Datas().cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) {
          GreekCity city = _cities[i];
          HeroWidget heroWidget = HeroWidget(city.image);
          return InkWell(
            onTap: () {
              Datas().pusher(context, city.name, HeroDetail(city, heroWidget));
            },
            child: Container(
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        width: 125,
                        child: heroWidget),
                    Text(city.name)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _cities.length);
  }
}
