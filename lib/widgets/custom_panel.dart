// lib/widgets/custom_panel.dart
import 'package:flutter/material.dart';
import 'package:web_ace_c/config/app_config.dart';
import 'package:web_ace_c/config/panel_config.dart';

class CustomPanel extends StatelessWidget implements PanelConfig {
  @override
  final String text;
  @override
  final ImageProvider? image;
  @override
  final VoidCallback onTap;
  @override
  final PanelStyle style;
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
  @override
  final Offset? imageOffset; // 新增图片偏移量

  const CustomPanel({
    super.key,
    required this.text,
    this.image,
    required this.onTap,
    this.style = const PanelStyle(),
    this.textColor = Colors.white,
    this.imageSize = 80.0,
    this.imageAlignment = Alignment.center,
    this.textSize = 24.0,
    this.textAlignment = Alignment.center,
    this.child,
    this.textOffset,
    this.imageOffset, // 新增
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                    offset: _calculateOffset(imageOffset, constraints),
                    child: Align(
                      alignment: imageAlignment ?? Alignment.center,
                      child: Image(
                        image: image!,
                        width: imageSize,
                        height: imageSize,
                      ),
                    ),
                  ),
                Align(
                  alignment: textAlignment ?? Alignment.center,
                  child: Transform.translate(
                    offset: _calculateOffset(textOffset, constraints),
                    child: _buildText(),
                  ),
                ),
                if (child != null) child!,
              ],
            ),
          ),
        );
      },
    );
  }

  Offset _calculateOffset(Offset? offset, BoxConstraints constraints) {
    if (offset == null) return Offset.zero;
    final isPercentage = offset.dx.abs() <= 1 && offset.dy.abs() <= 1;
    return isPercentage
        ? Offset(
          constraints.maxWidth * offset.dx,
          constraints.maxHeight * offset.dy,
        )
        : offset;
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: style.baseColor.withOpacity(0.25),
      borderRadius: BorderRadius.circular(style.borderRadiusFactor * 100),
      border: Border.all(
        color: style.borderRadiusFactor > 0.5 ? Colors.white : style.baseColor,
        width: style.borderRadiusFactor * 20,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(style.shadowOpacity),
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
    );
  }
}
