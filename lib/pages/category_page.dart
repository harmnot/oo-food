import 'package:flutter/material.dart';
import 'package:meals/dummy/category.dart';
import 'package:meals/views/category_list.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var grid = GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORY.map((catData) => CategoryList(
            img: catData.img,
            title: catData.title,
            id: catData.id)
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio:  3 / 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        )
    );


    return SafeArea(
      child: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            children: <Widget>[
          ...DUMMY_CATEGORY.map((catData) => CategoryList(
            img: catData.img,
            title: catData.title,
            id: catData.id)
          ).toList(),
            ],
          ),
        )
    );
  }
}
