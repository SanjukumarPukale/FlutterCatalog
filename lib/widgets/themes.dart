// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        accentColor: Colors.black,
        appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        // ignore: deprecated_member_use
        textTheme: Theme.of(context).textTheme,
        )
      );

      static ThemeData darkTheme(BuildContext context) => ThemeData(
        // brightness: Brightness.dark,
        // fontFamily: GoogleFonts.poppins().fontFamily,
        // cardColor: Colors.black,
        // canvasColor: darkCreamColor,
        // appBarTheme: AppBarTheme(
        // color: Colors.black,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        // )
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(),
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        accentColor: Colors.red,
        appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        // ignore: deprecated_member_use
        textTheme: Theme.of(context).textTheme,
        )
      );

      //colors
      static Color creamColor = Color(0xfff5f5f5);
      static Color darkCreamColor = Vx.gray900;
      static Color darkBluishColor = Color(0xff403b58);
      static Color lightBluishColor = Vx.indigo500;
}