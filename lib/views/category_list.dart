import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryList({this.title, this.color, this.id });

  void _selectedCategory(BuildContext ctx,String id, txt) {
    Category category = Category(id: id, title: title);
    Navigator.pushNamed(ctx, '/categories-list',arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedCategory(context, id, title),
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
                color.withOpacity(0.6),
                color
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
