import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/pages/category_page.dart';
import 'package:meals/services/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Map<int, Color> color = {
    900: Color.fromRGBO(255, 179, 255, .0),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ntrTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: MaterialColor(0xFFffccff, color),
        accentColor: Colors.amber
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}
