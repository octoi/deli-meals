import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, idx) {
        return MealItem(meal: favoriteMeals[idx]);
      },
      itemCount: favoriteMeals.length,
    );
  }
}
