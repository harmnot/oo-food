import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/pages/category_page.dart';
import 'package:meals/services/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Map<int, Color> color = {
    50: Color.fromRGBO(255, 92, 87, .1),
    100: Color.fromRGBO(255, 92, 87, .2),
    200: Color.fromRGBO(255, 92, 87, .3),
    300: Color.fromRGBO(255, 92, 87, .4),
    400: Color.fromRGBO(255, 92, 87, .5),
    500: Color.fromRGBO(255, 92, 87, .6),
    600: Color.fromRGBO(255, 92, 87, .7),
    700: Color.fromRGBO(255, 92, 87, .8),
    800: Color.fromRGBO(255, 92, 87, .9),
    900: Color.fromRGBO(255, 92, 87, 1),
  };

  @override
  Widget build(BuildContext context) {

    MaterialColor colorCustom = MaterialColor(0xFFffb3d9, color);

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ntrTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: colorCustom,
        accentColor: Colors.amber
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}
