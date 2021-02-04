import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 110,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            EdgeInsetsGeometry marginBetweenItems =
                EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20);
            return Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: marginBetweenItems,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentSelectedItem = index;
                      });
                    },
                    child: Card(
                      color: currentSelectedItem != index
                          ? Colors.white
                          : Colors.black.withOpacity(0.7),
                      child: Icon(
                        Icons.fastfood,
                        color: currentSelectedItem == index
                            ? Colors.white
                            : Colors.black.withOpacity(0.7),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                Container(
                  margin: marginBetweenItems,
                  child: Center(
                    child: Text('Burger'),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
