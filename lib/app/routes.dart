// lib/app/routes.dart
import 'package:flutter/material.dart';
import 'package:web_ace_c/g_data/2048/game_ui.dart';
import 'package:web_ace_c/widgets/home_page.dart';

class Routes {
  static const home = '/';
  static const game2048 = '/game2048';
  static const dashboard = '/dashboard';
  static const analytics = '/analytics';
  static const settings = '/settings';
  static const profile = '/profile';
  static const notifications = '/notifications';
  static const documents = '/documents';
  static const cloud = '/cloud';
  static final all = <String, Widget Function(BuildContext)>{
    home: (context) => const HomePage(),
    game2048: (context) => const Game2048Page(),
  };
}
