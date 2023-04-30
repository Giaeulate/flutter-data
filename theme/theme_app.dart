import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static Color black = const Color(0xff222222);
  static Color grey = const Color(0xff777777);
  static Color lightGrey = const Color(0xffECEEF2);
  static Color red = const Color(0xffAD0F31);
  static Color yellow = const Color(0xffF9E300);
  static Color white = const Color(0xffffffff);
  static Color green = const Color(0xff198754);
  static Color softGrey = const Color.fromRGBO(
    237,
    239,
    244,
    0.25,
  );
  static Color softRed = const Color.fromRGBO(173, 15, 49, 0.05);

  static OutlineInputBorder focusBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(4.0),
    ),
    borderSide: BorderSide(
      color: ApplicationTheme.red,
      width: 2,
    ),
  );

  static OutlineInputBorder disableBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(4.0),
    ),
    borderSide: BorderSide(
      color: ApplicationTheme.lightGrey,
      width: 2,
    ),
  );

  static ThemeData getApplicationTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.montserrat().fontFamily,

      scaffoldBackgroundColor: ApplicationTheme.white,

      iconTheme: IconThemeData(
        color: black,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 24.0,
        ),
        displayMedium: TextStyle(
          fontSize: 22.0,
        ),
        displaySmall: TextStyle(
          fontSize: 20.0,
        ),
        headlineMedium: TextStyle(
          fontSize: 18.0,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.0,
        ),
        titleLarge: TextStyle(
          fontSize: 14.0,
        ),
      ),

      dividerTheme: DividerThemeData(
        thickness: 1.0,
        color: yellow,
      ),
    );
  }
}
