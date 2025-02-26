class MenuItem {
  final String title;
  final String? routeName;
  final List<MenuItem>? children;

  const MenuItem({
    required this.title,
    this.routeName,
    this.children,
  });
}
