import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      indicatorColor: darkBluishColor,
      primaryColor: darkBluishColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkBluishColor
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(darkBluishColor)
          )
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: creamColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black)
      )
  );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
          cardColor: Colors.black,
          canvasColor: darkBgColor,
          indicatorColor: Colors.white,
          primaryColor: lightBluishColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: lightBluishColor
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(lightBluishColor)
              )
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: darkBgColor,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)
          )
      );

  //Colors
  static Color creamColor = const Color(0xfffcfbf4);
  static Color darkBgColor = Colors.blueGrey[900]!;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = const Color(0xFF274a99);

}
