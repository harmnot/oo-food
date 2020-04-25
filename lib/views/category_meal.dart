import 'dart:ui';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/pages/meal_detail_page.dart';

class CategoryMeals extends StatelessWidget {
  final String title;
  final String image;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final List<String> steps;
  final List<String> ingredients;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isGlutenFree;

  CategoryMeals({
    this.title,
    this.image,
    this.affordability,
    this.complexity,
    this.duration,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.ingredients,
    this.steps,
    this.isLactoseFree
  });

  void _selectedToMealDetail(BuildContext ctx,
      List<String> ingredients, steps,
      int duration,
      String image, title,
      bool isVegan, isVegetarian, isLactoseFree, isGlutenFree
      ) {
    final Map<String, dynamic> args = {
      'title': title,
      'image': image,
      'duration': duration,
      'steps': steps,
      'ingredients': ingredients,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
    };
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF282828),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      elevation: 30,
      borderOnForeground: true,
      margin: EdgeInsets.all(14),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 100,
              spreadRadius: -80,
              offset: Offset.fromDirection(0, 80)
            )
          ]
        ),
        child: InkWell(
          onTap:() => _selectedToMealDetail(context,
              ingredients, steps, duration,
              image, title, isVegan, isVegetarian,
              isLactoseFree, isGlutenFree,
          ),
          child: Container(
            padding: EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ), textAlign: TextAlign.center),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.dollarSign, size: 13.5, color: Colors.white),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(EnumToString.parse(affordability),  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.thermometerHalf, size: 13.5, color: Colors.white),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(EnumToString.parse(complexity), style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.clock, textDirection: TextDirection.ltr, size: 12, color: Colors.white),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("$duration minutes", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ),
                Flexible(
                    flex: 1,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
