import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final dynamic data;

  MealDetail({this.data});
  
  Widget _test(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*2,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(data['image']),
            ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Container(
                          height: MediaQuery.of(context).size.width * 0.14,
                          child: ListTile(
                            leading: Icon(Icons.radio_button_checked, size: 17),
                            title: Text(data['ingredients'][index],),
                          )
                      );
                    },
                    itemCount: data['ingredients'].length,
                  ),
          ],
        ),
      ),
    );
  }

  Text _titleText(text) {
    return Text(text.toUpperCase(),
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 19,
            letterSpacing: 1.7
        )
    );
  }


  Widget _test2(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFE5E4E2),
                        blurRadius: 79,
                        spreadRadius: -100
                      )
                    ]
                  ),
                  padding: EdgeInsets.fromLTRB(80, 80, 80, 50),
                  child: Image.asset(data['image'], fit: BoxFit.cover,),
                ),
                Center(
                  child: _titleText('ingredients')
                ),
                ...data['ingredients'].map((item){
                  return Container(
                        height: MediaQuery.of(context).size.height * 0.056,
                        child: ListTile(
                          leading: Icon(Icons.radio_button_checked, size: 19,color: Colors.white,) ,
                          title: Text(item, style: TextStyle(color: Colors.white)),
                        ),
                  );
                }),
                Center(
                  child: _titleText('steps'),
                  heightFactor: 2.0,
                ),
                ...data['steps'].asMap().entries.map((entry) {
                  int index = entry.key+1;
                  String step = entry.value;
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                    child: Text("$index. $step", style: GoogleFonts.chivo(
                        height: 1.399, color: Colors.white
                    )),
                  );
                }),
                SizedBox(
                  height: 50,
                )
              ],
            )
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['title'],
          softWrap: true,
        ),
      ),
      body: _test2(context)
    );
  }
}
