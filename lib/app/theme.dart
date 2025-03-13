// lib/app/theme.dart
import 'package:flutter/material.dart';
import 'package:web_ace_c/config/app_config.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppConfig.primaryColor,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: AppConfig.baseFontSize * 1.2),
    bodyMedium: TextStyle(fontSize: AppConfig.baseFontSize),
  ),
);
