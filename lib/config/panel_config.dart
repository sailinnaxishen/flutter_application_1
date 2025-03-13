// lib/config/panel_config.dart
import 'package:flutter/material.dart';
import 'package:web_ace_c/config/app_config.dart';

class PanelStyle {
  final Color baseColor;
  final double borderRadiusFactor;
  final double shadowOpacity;

  const PanelStyle({
    this.baseColor = AppConfig.primaryColor,
    this.borderRadiusFactor = 0.5,
    this.shadowOpacity = 0.25,
  });
}

class PanelConfig {
  final String text;
  final ImageProvider? image;
  final VoidCallback onTap;
  final PanelStyle style;
  final Color textColor;
  final Widget? child;
  final double? imageSize;
  final Alignment? imageAlignment;
  final double? textSize;
  final Alignment? textAlignment;
  final Offset? textOffset;
  final Offset? imageOffset;

  const PanelConfig({
    required this.text,
    this.image,
    required this.onTap,
    this.style = const PanelStyle(),
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

class PanelConfigs {
  static const _defaultImageSize = 140.0;
  static const _defaultTextSize = 32.0;
  static final panel1 = PanelConfig(
    text: 'Dashboard Pro',
    image: const AssetImage('assets/images/item_7.png'),
    onTap: () => debugPrint('Dashboard Panel tapped'),
    style: const PanelStyle(
      baseColor: Colors.blueAccent,
      borderRadiusFactor: 1.0,
      shadowOpacity: 0.5,
    ),
    textColor: Colors.amber,
    textSize: _defaultTextSize,
    textAlignment: const Alignment(0.8, 0),
    imageSize: _defaultImageSize,
    imageAlignment: const Alignment(-0.8, 0),
  );

  static final panel2 = PanelConfig(
    text: 'Dashboard Pro',
    image: const AssetImage('assets/images/item_7.png'),
    onTap: () => debugPrint('Dashboard Panel tapped'),
    style: const PanelStyle(
      baseColor: Colors.blueAccent,
      borderRadiusFactor: 1.0,
      shadowOpacity: 0.5,
    ),
    textColor: Colors.amber,
    textSize: _defaultTextSize,
    textAlignment: const Alignment(0.8, 0),
    textOffset: const Offset(-40, 0),
    imageSize: _defaultImageSize,
    imageAlignment: const Alignment(0, 0),
    imageOffset: const Offset(-60, 0),
  );
}
