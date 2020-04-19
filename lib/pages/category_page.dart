import 'package:flutter/material.dart';
import 'package:meals/dummy/category.dart';
import 'package:meals/views/category_list.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
        ),
        body: GridView(
            padding: EdgeInsets.all(10),
            children: DUMMY_CATEGORY.map((catData) => CategoryList(color: catData.color, title: catData.title, id: catData.id)).toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio:  3 / 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            )
        ),
      ),
    );
  }
}
