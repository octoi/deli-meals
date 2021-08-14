import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have no favorites yet - start adding some'),
    );
  }
}
