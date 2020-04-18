import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../dummy/category.dart';

class ItemsCategory extends StatelessWidget {
  final Category data;

  ItemsCategory({this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(data.title),
          ),
          body: Container(
            child: Text(data.title)
          ),
        )
    );
  }
}
