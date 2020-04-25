import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/pages/items_category_page.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final String img;

  CategoryList({this.title, this.img, this.id });

  void selectedCategory(BuildContext ctx, String id, txt) {
    Navigator.of(ctx).pushNamed(ItemsCategory.routeName, arguments: { 'id': id, 'title': txt} );
  }

  @override
  Widget build(BuildContext context) {

    var old = Container(
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
    );

    print(img);

    return InkWell(
      onTap: () => selectedCategory(context, id, title),
      child: Container(
        margin: EdgeInsets.only(bottom: 20, right: 20),
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              width: 200,
              height: 189,
              decoration: BoxDecoration(
                color: Color(0xFF282828),
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/$img",fit: BoxFit.contain,),
            ),
            Positioned(
                left: 40,
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF17161b),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF343132),
                        spreadRadius: 0.01,
                        blurRadius: 8
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ],
        ),
      )
    );
  }
}
