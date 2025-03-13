// lib/app/app.dart
import 'package:flutter/material.dart';
import 'package:web_ace_c/app/routes.dart';
import 'package:web_ace_c/app/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Ace',
      theme: appTheme,
      initialRoute: Routes.home,
      routes: Routes.all,
      debugShowCheckedModeBanner: false,
    );
  }
}
