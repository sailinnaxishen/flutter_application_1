import 'package:flutter/material.dart';
import '../models/menu_item_model.dart';

class NavigationState extends ChangeNotifier {
  MenuItem? _selectedMenuItem;
  int? _expandedIndex;

  MenuItem? get selectedMenuItem => _selectedMenuItem;
  int? get expandedIndex => _expandedIndex;

  void setExpandedIndex(int? index) {
    _expandedIndex = index;
    notifyListeners();
  }

  void selectMenuItem(MenuItem item) {
    _selectedMenuItem = item;
    notifyListeners();
  }
}
