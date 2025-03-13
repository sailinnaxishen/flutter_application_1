// lib/widgets/home_page.dart
import 'package:web_ace_c/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:web_ace_c/config/app_config.dart';
import 'package:web_ace_c/config/panel_config.dart';
import 'package:web_ace_c/widgets/custom_panel.dart';
import 'package:web_ace_c/config/item_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildAdaptiveBackground(),
          _buildResponsiveLeftPanel(),
          _buildResponsiveRightMatrix(),
        ],
      ),
    );
  }

  // 构建自适应背景
  Widget _buildAdaptiveBackground() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/se1.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppConfig.primaryColor.withOpacity(0.1),
              BlendMode.overlay,
            ),
          ),
        ),
      ),
    );
  }

  // 构建响应式左侧面板
  Widget _buildResponsiveLeftPanel() {
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.4,
            child: Center(
              child: SizedBox(
                width: constraints.maxWidth * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) =>
                        _buildAdaptivePanel(index, constraints.maxHeight),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 构建自适应面板
  Widget _buildAdaptivePanel(int index, double screenHeight) {
    final panelHeight = screenHeight * 0.3;
    final panelConfig = _getPanelConfig(index);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
      child: SizedBox(
        height: panelHeight,
        child: CustomPanel(
          text: panelConfig.text,
          image: panelConfig.image,
          onTap: panelConfig.onTap,
          style: panelConfig.style,
          textColor: panelConfig.textColor,
          child: panelConfig.child,
          imageSize: panelConfig.imageSize,
          imageAlignment: panelConfig.imageAlignment,
          textSize: panelConfig.textSize,
          textAlignment: panelConfig.textAlignment,
          textOffset: panelConfig.textOffset,
        ),
      ),
    );
  }

  // 获取 Panel 配置
  PanelConfig _getPanelConfig(int index) {
    final panels = [PanelConfigs.panel1, PanelConfigs.panel2];
    return panels[index.clamp(0, panels.length - 1)];
  }

  // 获取 Item 配置
  ItemConfig _getItemConfigForRightPanel(int index) {
    final items = [
      ItemConfigs.item1(context),
      ItemConfigs.item2(context),
      ItemConfigs.item3(context),
      ItemConfigs.item4(context),
      ItemConfigs.item5(context),
      ItemConfigs.item6(context),
      ItemConfigs.item7(context),
      ItemConfigs.item8(context),
      ItemConfigs.item9(context),
      ItemConfigs.item10(context),
      ItemConfigs.item11(context),
      ItemConfigs.item12(context),
    ];
    return items[index.clamp(0, items.length - 1)];
  }

  // 构建响应式右侧矩阵
  Widget _buildResponsiveRightMatrix() {
    return Align(
      alignment: Alignment.centerRight,
      child: FractionalTranslation(
        translation: const Offset(-0.05, 0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth * 0.6,
              child: Center(
                child: SizedBox(
                  width: constraints.maxWidth * 0.4,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (rowIndex) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.0015,
                            ),
                            child: Row(
                              children: List.generate(
                                4,
                                (colIndex) => Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.005,
                                    ),
                                    child: _buildRightPanel(
                                      rowIndex * 4 + colIndex,
                                      constraints.maxHeight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // 构建右侧面板
  Widget _buildRightPanel(int index, double screenHeight) {
    final panelHeight = screenHeight * 0.3 / 3;
    final itemConfig = _getItemConfigForRightPanel(index);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      child: SizedBox(
        height: panelHeight,
        child: CustomItem(
          text: itemConfig.text,
          image: itemConfig.image,
          onTap: itemConfig.onTap,
          style: itemConfig.style,
          textColor: itemConfig.textColor,
          child: itemConfig.child,
          imageSize: itemConfig.imageSize,
          imageAlignment: itemConfig.imageAlignment,
          textSize: itemConfig.textSize,
          textAlignment: itemConfig.textAlignment,
          textOffset: itemConfig.textOffset,
          imageOffset: itemConfig.imageOffset,
        ),
      ),
    );
  }
}

// 定义 CustomItem 小部件
class CustomItem extends StatelessWidget implements ItemConfig {
  @override
  final Offset? imageOffset;
  @override
  final String text;
  @override
  final ImageProvider? image;
  @override
  final VoidCallback onTap;
  @override
  final ItemStyle style;
  @override
  final Color textColor;
  @override
  final Widget? child;
  @override
  final double? imageSize;
  @override
  final Alignment? imageAlignment;
  @override
  final double? textSize;
  @override
  final Alignment? textAlignment;
  @override
  final Offset? textOffset;

  const CustomItem({
    super.key,
    required this.text,
    this.image,
    required this.onTap,
    required this.style,
    required this.textColor,
    this.child,
    this.imageSize,
    this.imageAlignment,
    this.textSize,
    this.textAlignment,
    this.textOffset,
    this.imageOffset = Offset.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: _buildDecoration(),
        child: Stack(
          children: [
            if (image != null)
              Transform.translate(
                offset: imageOffset ?? Offset.zero,
                child: Align(
                  alignment: imageAlignment ?? Alignment.center,
                  child: Image(
                    image: image!,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
            Center(
              child: Transform.translate(
                offset: textOffset ?? Offset.zero,
                child: _buildText(),
              ),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: style.activeColor.withOpacity(0.25),
      borderRadius: BorderRadius.circular(style.borderWidthFactor * 100),
      border: Border.all(
        color: style.borderWidthFactor > 0.5 ? Colors.white : style.activeColor,
        width: style.borderWidthFactor * 20,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    );
  }

  Text _buildText() {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      textAlign:
          textAlignment == Alignment.center
              ? TextAlign.center
              : TextAlign.start,
    );
  }
}
