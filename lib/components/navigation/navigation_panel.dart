import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/menu_config.dart';
import '../../state/navigation_state.dart';
import 'side_menu.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationState = Provider.of<NavigationState>(context);
    return SideMenu(
      menuItems: menuItems,
      onItemSelected: (item) {
        navigationState.selectMenuItem(item);
        if (item.routeName != null) {
          Navigator.pushReplacementNamed(context, item.routeName!);
        }
      },
    );
  }
}
