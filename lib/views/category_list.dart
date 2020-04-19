import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryList({this.title, this.color, this.id });

  void selectedCategory(BuildContext ctx, String id, txt) {
    Navigator.of(ctx).pushNamed('/categories-list', arguments: { 'id': id, 'title': txt} );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context, id, title),
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                color.withOpacity(0.1),
                color,
                Color(0xffffb3d9)
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.1,
              0.4,
              0.6,
            ]
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
