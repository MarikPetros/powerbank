import 'package:flutter/material.dart';

final _base = ThemeData(useMaterial3: true, fontFamily: 'Inter');
final textColor = const Color(0xFF0B0B0B);
final appTheme = _base.copyWith(
  textTheme: TextTheme(
    headlineLarge:
    TextStyle(fontWeight: FontWeight.w300, fontSize: 20, height: 1.25, color: textColor),
    titleMedium:
    TextStyle(fontWeight: FontWeight.w400, fontSize: 16, height: 1.25),
    bodyMedium:
    TextStyle(fontWeight: FontWeight.w300, fontSize: 14, height: 1.0, color: textColor),
    displaySmall:
    TextStyle(fontWeight: FontWeight.w500, fontSize: 20, height: 1.0),
  ),
);
