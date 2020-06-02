import 'package:flutter/material.dart';
import 'package:flutterguidesection7meals/models/meal.dart';
import 'package:flutterguidesection7meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoritesMeals;

  FavoritesScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritesMeals.isEmpty) {
      return Center(
        child: Text("Vous n'avez pas encore de favori"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: _favoritesMeals[index].id,
              title: _favoritesMeals[index].title,
              imageUrl: _favoritesMeals[index].imageUrl,
              complexity: _favoritesMeals[index].complexity,
              affordability: _favoritesMeals[index].affordability,
              duration: _favoritesMeals[index].duration);
        },
        itemCount: _favoritesMeals.length,
      );
    }
  }
}
