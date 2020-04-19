import 'dart:ui';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals/models/meal.dart';

class CategoryMeals extends StatelessWidget {
  final String title;
  final String image;
  final Affordability affordability;
  final Complexity complexity;

  CategoryMeals({this.title, this.image, this.affordability, this.complexity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      elevation: 14,
      margin: EdgeInsets.all(14),
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
                        style: TextStyle(height: 1.2, fontSize: 16), textAlign: TextAlign.center,),
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
                              FaIcon(FontAwesomeIcons.thermometerHalf),
                              SizedBox(
                                width: 20,
                              ),
                              Text(EnumToString.parse(affordability),  style: TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              FaIcon(FontAwesomeIcons.thermometerHalf),
                              SizedBox(
                                width: 20,
                              ),
                              Text(EnumToString.parse(complexity), style: TextStyle(fontWeight: FontWeight.w600)),
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
      )
    );
  }
}
