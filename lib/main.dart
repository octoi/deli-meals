import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/screens/category_meals_screen.dart';
import 'package:deli_meals/screens/filters_screen.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import 'package:deli_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] ?? false) && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'] ?? false) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] ?? false) && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] ?? false) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
