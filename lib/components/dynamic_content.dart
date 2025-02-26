import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/navigation_state.dart';
import '../app/routes.dart';

class DynamicContent extends StatelessWidget {
  const DynamicContent({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationState = Provider.of<NavigationState>(context);
    final selectedItem = navigationState.selectedMenuItem;

    return Container(
      padding: const EdgeInsets.all(20),
      child: selectedItem?.routeName != null
          ? _buildContentFromRoute(context, selectedItem!.routeName!)
          : const Center(child: Text('请选择菜单项', style: TextStyle(fontSize: 24))),
    );
  }

  Widget _buildContentFromRoute(BuildContext context, String routeName) {
    final routeBuilder = appRoutes[routeName];
    return routeBuilder != null
        ? routeBuilder(context)
        : const Center(child: Text('页面未配置', style: TextStyle(fontSize: 24)));
  }
}
