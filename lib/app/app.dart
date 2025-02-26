import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/navigation_state.dart';
import 'theme.dart';
import '../components/navigation/navigation_panel.dart';
import '../components/dynamic_content.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationState>(
      // 显式指定泛型类型
      create: (_) => NavigationState(),
      builder: (context, child) => MaterialApp(
        title: 'dome',
        theme: appTheme(),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 左侧20%固定菜单栏
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: const BoxDecoration(
              color: Color(0xFF2D2D2D),
              border: Border(right: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: const NavigationPanel(),
          ),
          // 右侧80%内容区域
          Expanded(
            child: Container(
              color: Colors.white,
              child: const DynamicContent(),
            ),
          ),
        ],
      ),
    );
  }
}
