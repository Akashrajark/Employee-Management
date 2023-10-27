import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/color.dart';

ThemeData appTheme = ThemeData.light().copyWith(
  useMaterial3: false,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: appBarIconColor,
    ),
    actionsIconTheme: IconThemeData(
      color: appBarIconColor,
    ),
    elevation: 1,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: inputFillColor,
    isCollapsed: true,
    filled: true,
    iconColor: iconColor,
    prefixIconColor: iconColor,
    hintStyle: ThemeData.light().textTheme.titleLarge?.copyWith(
          color: mutedTextColor,
          fontWeight: FontWeight.w400,
        ),
    labelStyle: ThemeData.light().textTheme.titleLarge?.copyWith(
          color: mutedTextColor,
          fontWeight: FontWeight.w400,
        ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: Colors.black12,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: Colors.black12,
      ),
    ),
  ),
  textTheme: GoogleFonts.montserratTextTheme(
    ThemeData.light().textTheme.copyWith(
          titleLarge: ThemeData.light().textTheme.titleLarge?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
          titleMedium: ThemeData.light().textTheme.titleLarge?.copyWith(
                color: Colors.black87,
              ),
          titleSmall: ThemeData.light().textTheme.titleLarge?.copyWith(
                color: secondaryTextColor,
                fontWeight: FontWeight.w600,
              ),
          headlineLarge: ThemeData.light().textTheme.headlineLarge?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
          headlineMedium: ThemeData.light().textTheme.headlineMedium?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
          headlineSmall: ThemeData.light().textTheme.headlineSmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
        ),
  ),
);
