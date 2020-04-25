import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy/meals.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/category_meal.dart';
import '../dummy/category.dart';

class ItemsCategory extends StatelessWidget {
  static const routeName = "/categories-list";

  final dynamic data;

  ItemsCategory({this.data});

  @override
  Widget build(BuildContext context) {
    final List<Meal> categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(data['id']);
    }).toList();

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(data['title']),
          ),
          backgroundColor: Color(0xFF0C090A),
          body: ListView.builder(
            itemBuilder: (ctx, index) {
              return CategoryMeals(
                title: categoryMeals[index].title,
                image: categoryMeals[index].imageUrl,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,
                steps: categoryMeals[index].steps,
                ingredients: categoryMeals[index].ingredients,
                isGlutenFree: categoryMeals[index].isGlutenFree,
                isLactoseFree: categoryMeals[index].isLactoseFree,
                isVegan: categoryMeals[index].isVegan,
                isVegetarian: categoryMeals[index].isVegetarian,
              );
            },
            itemCount: categoryMeals.length,
          )
        )
    );
  }
}
