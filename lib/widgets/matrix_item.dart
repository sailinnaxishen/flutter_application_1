// lib/widgets/matrix_item.dart
import 'package:flutter/material.dart';
import '../config/item_config.dart';

class CustomItem extends StatelessWidget implements ItemConfig {
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
  @override
  final Offset? imageOffset; // 新增

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
    this.imageOffset, // 新增
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: _buildDecoration(),
        // 更新 Stack 部分代码
        child: Stack(
          children: [
            if (image != null)
              Positioned(
                left: imageOffset?.dx,
                top: imageOffset?.dy,
                child: Align(
                  alignment: imageAlignment ?? Alignment.center,
                  child: Image(
                    image: image!,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
            Positioned(
              left: textOffset?.dx,
              top: textOffset?.dy,
              child: _buildText(),
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
