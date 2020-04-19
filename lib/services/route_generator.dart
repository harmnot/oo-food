import 'package:flutter/material.dart';
import 'package:meals/pages/category_page.dart';
import 'package:meals/pages/items_category_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    const homePage = '/';
    const categoriesPage = '/categories-list';
    const categoryItem = '/category-item';

    switch(settings.name) {
      case homePage:
        return MaterialPageRoute(
            builder: (_)=> CategoryPage(),
        );
      case categoriesPage:
        return MaterialPageRoute(
          builder: (_) => ItemsCategory(data: args),
        );
      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error Page'),
          ),
          body: Center(
            child: Text("can't found any page"),
          ),
        );
      }
    );
  }
}