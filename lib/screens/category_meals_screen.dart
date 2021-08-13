import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String categoryId = routeArgs['id'].toString();
    final String categoryTitle = routeArgs['title'].toString();
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          // return Text(categoryMeals[idx].title);
          return MealItem(categoryMeals[idx]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
