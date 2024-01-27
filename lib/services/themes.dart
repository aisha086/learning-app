import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      indicatorColor: darkCanvasColor,
      cardColor: lightIconColor,
      canvasColor: lightCanvasColor,
      primaryColor: lightAppBarColor,
      focusColor: lightContainerColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightIconColor
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(lightAppBarColor)
          )
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: lightAppBarColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: darkCanvasColor)
      )
  );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
          indicatorColor: lightCanvasColor,
          cardColor: darkIconColor,
          canvasColor: darkCanvasColor,
          primaryColor: darkAppBarColor,
          focusColor: darkContainerColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: darkIconColor
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(darkAppBarColor)
              )
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: darkAppBarColor,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: lightCanvasColor)
          )
      );

  //Colors
  static Color lightCanvasColor = const Color(0xfffffbf5);
  static Color lightContainerColor = const Color(0xfff7EFE5);
  static Color lightIconColor = const Color(0xffC3ACD0);
  static Color lightAppBarColor = const Color(0xff7743DB);
  static Color darkCanvasColor = const Color(0xff222831);
  static Color darkContainerColor = const Color(0xff393E46);
  static Color darkIconColor = const Color(0xffd05aed);
  static Color darkAppBarColor = const Color(0xff7743DB);

}
