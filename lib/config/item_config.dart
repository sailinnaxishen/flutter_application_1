// lib/config/item_config.dart
import 'package:flutter/material.dart';
import 'package:web_ace_c/app/routes.dart';
import 'package:web_ace_c/widgets/pages/web_view_page.dart'; // Adjust the import path as necessary

class ItemStyle {
  final Color activeColor;
  final Color inactiveColor;
  final double borderWidthFactor;

  const ItemStyle({
    this.activeColor = const Color(0x99666B8D),
    this.inactiveColor = const Color(0x407B8BEF),
    this.borderWidthFactor = 0.008,
  });
}

class ItemConfig {
  final String text;
  final ImageProvider? image;
  final VoidCallback onTap;
  final ItemStyle style;
  final Color textColor;
  final Widget? child;
  final double? imageSize;
  final Alignment? imageAlignment;
  final double? textSize;
  final Alignment? textAlignment;
  final Offset? textOffset;
  final Offset? imageOffset;

  const ItemConfig({
    required this.text,
    this.image,
    required this.onTap,
    this.style = const ItemStyle(),
    this.textColor = Colors.white,
    this.imageSize,
    this.imageAlignment,
    this.textSize,
    this.textAlignment,
    this.child,
    this.textOffset,
    this.imageOffset,
  });
}

class ItemConfigs {
  static const _defaultImageSize = 80.0;
  static const _defaultTextSize = 24.0;

  // 创建一个名为item1的静态方法，返回一个ItemConfig对象
  static ItemConfig item1(BuildContext context) => ItemConfig(
    text: 'github',
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => WebViewPage(
                url:
                    'https://github.com/sailinnaxishen/flutter_application_1/tree/NewPackages',
              ),
        ),
      );
    },
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 214, 170, 170),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 0, 0, 0),
    textSize: _defaultTextSize,
    // 使用明确的像素偏移（例如：左移20，上移0）
    textOffset: const Offset(30, 0),
    child: Image(
      image: const AssetImage('assets/images/item_7.png'),
      width: 70,
      height: 80,
      fit: BoxFit.contain,
    ),
  );
  static ItemConfig item2(BuildContext context) => ItemConfig(
    text: 'item2',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item3(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item4(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item5(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item6(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item7(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item8(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item9(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item10(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item11(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
  static ItemConfig item12(BuildContext context) => ItemConfig(
    text: 'item3',
    onTap: () => Navigator.pushNamed(context, Routes.game2048),
    style: const ItemStyle(
      activeColor: Color.fromARGB(255, 0, 0, 0),
      inactiveColor: Color.fromARGB(255, 9, 175, 104),
      borderWidthFactor: 0.012,
    ),
    textColor: const Color.fromARGB(255, 143, 125, 123),
    textSize: _defaultTextSize,
    textOffset: const Offset(0, 0),
  );
}
