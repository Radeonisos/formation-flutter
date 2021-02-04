import 'package:course_app_hamburger/burger_page.dart';
import 'package:flutter/material.dart';

class HamburgerList extends StatefulWidget {
  final int row;

  HamburgerList({this.row});

  @override
  _HamburgerListState createState() => _HamburgerListState();
}

class _HamburgerListState extends State<HamburgerList> {
  int items = 10;

  Widget baconImage = Container(
    height: 160,
    child: Image.asset("assets/burger1.png"),
  );

  Widget chickenImage = Container(
    height: 135,
    child: Image.asset("assets/burger2.png"),
  );

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 240,
        margin: EdgeInsets.only(top: 10, bottom: widget.row == 2 ? 60 : 0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items,
            itemBuilder: (context, index) {
              bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
              return Stack(
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(
                        left: index == 0 ? 10 : 0, right: index == 0 ? 10 : 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BurgerPage.routeName);
                      },
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(45),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45))),
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              Text(
                                reverse ? 'Chicken Burger' : 'Burger',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    "15,95 €",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: reverse ? 40 : 55,
                      left: reverse ? -15 : -29,
                      child: GestureDetector(
                        child: reverse ? baconImage : chickenImage,
                        onTap: () {
                          Navigator.of(context).pushNamed(BurgerPage.routeName);
                        },
                      ))
                ],
              );
            }),
      ),
    );
  }
}
