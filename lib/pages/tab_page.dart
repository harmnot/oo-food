import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/pages/category_page.dart';
import 'package:meals/pages/favorite_page.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {

  var _topTab = DefaultTabController(
    initialIndex: 1,
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        title: Text('meal'),
        bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorite'
              )
            ]
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          CategoryPage(),
          FavoritePage(),
        ],
      ),
    ),
  );

  final List<Map<String, Object>> _pages = [
   { 'title': 'Categories' , 'page': CategoryPage() },
   { 'title': 'Favorite', 'page': FavoritePage() },
  ];

  int selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[selectedIndex]['title']),
        ),
      body: _pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category', style: TextStyle( color: Colors.white),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite', style: TextStyle( color: Colors.white),)
          )
        ],
      ) ,
    );
  }
}
