import 'package:flutter/material.dart';
import '../../models/menu_item_model.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final Function(MenuItem) onItemSelected;

  const MenuItemWidget({
    super.key,
    required this.item,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      onTap: () => onItemSelected(item),
      // 处理子菜单项...
    );
  }
}
