import 'package:flutter/material.dart';
import '../pages/zs1.dart';
import '../pages/zs2.dart';

final appRoutes = <String, WidgetBuilder>{
  '/zs1': (context) => const ZS1Page(),
  '/zs2': (context) => const ZS2Page(),
};
