import 'package:flutter/material.dart';
import '../../models/menu_item_model.dart';
import 'package:provider/provider.dart';
import '../../state/navigation_state.dart';

class SideMenu extends StatelessWidget {
  final List<MenuItem> menuItems;
  final Function(MenuItem) onItemSelected;

  const SideMenu({
    super.key,
    required this.menuItems,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final navigationState = Provider.of<NavigationState>(context);

    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      itemCount: menuItems.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: Colors.grey),
      itemBuilder: (context, index) => _buildMenuItem(
        menuItems[index],
        index,
        navigationState,
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item, int index, NavigationState state) {
    if (item.children == null) {
      return _buildSimpleTile(item);
    } else {
      return _buildExpandableTile(item, index, state);
    }
  }

  Widget _buildSimpleTile(MenuItem item) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: _CenteredTitle(text: item.title),
      onTap: () => onItemSelected(item),
    );
  }

  Widget _buildExpandableTile(MenuItem item, int index, NavigationState state) {
    return ExpansionTile(
      key: ValueKey(index),
      tilePadding: EdgeInsets.zero,
      leading: const SizedBox(width: 0),
      title: _CenteredTitle(text: item.title),
      trailing: const SizedBox(width: 0),
      initiallyExpanded: state.expandedIndex == index,
      onExpansionChanged: (expanded) {
        state.setExpandedIndex(expanded ? index : null);
      },
      iconColor: Colors.transparent,
      collapsedIconColor: Colors.transparent,
      childrenPadding: const EdgeInsets.only(left: 24),
      children: [
        ...item.children!.map((child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: _CenteredTitle(
                  text: child.title,
                  style: const TextStyle(color: Colors.white70),
                ),
                onTap: () => onItemSelected(child),
              ),
            ))
      ],
    );
  }
}

class _CenteredTitle extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const _CenteredTitle({
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        text,
        style: style ?? const TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
