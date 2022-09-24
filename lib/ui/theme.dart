import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData travelAppLightTheme = ThemeData(
  primarySwatch: Colors.teal,
  fontFamily: GoogleFonts.robotoSlab().fontFamily,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.grey.shade300,
    titleTextStyle: GoogleFonts.robotoCondensed(
      fontSize: 24,
      color: Colors.grey.shade800,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.robotoSlab(color: Colors.grey.shade800),
    titleMedium: GoogleFonts.robotoSlab(color: Colors.grey.shade800),
    titleSmall: GoogleFonts.robotoSlab(color: Colors.grey.shade800),
    bodyMedium: GoogleFonts.robotoSlab(color: Colors.grey.shade800),
    bodySmall: GoogleFonts.robotoSlab(color: Colors.grey.shade800),
    bodyLarge: GoogleFonts.robotoSlab(color: Colors.grey.shade800),
  ),
);

final ThemeData travelAppDarkTheme = ThemeData(
  primarySwatch: Colors.pink,
  fontFamily: GoogleFonts.robotoSlab().fontFamily,
  scaffoldBackgroundColor: Colors.grey.shade900,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.grey.shade800,
    titleTextStyle: GoogleFonts.robotoCondensed(
      fontSize: 24,
      color: Colors.grey.shade100,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.robotoSlab(color: Colors.grey.shade100),
    titleMedium: GoogleFonts.robotoSlab(color: Colors.grey.shade100),
    titleSmall: GoogleFonts.robotoSlab(color: Colors.grey.shade100),
    bodyMedium: GoogleFonts.robotoSlab(color: Colors.grey.shade100),
    bodySmall: GoogleFonts.robotoSlab(color: Colors.grey.shade100),
    bodyLarge: GoogleFonts.robotoSlab(color: Colors.grey.shade100),
  ),
);
