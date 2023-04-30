import 'package:flutter/material.dart';
import '../theme/theme_app.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? textColor;
  final Color? color;
  final Size? size;
  final EdgeInsets? padding;
  
  const CustomButton({
    super.key,
    this.onPressed,
    required this.label,
    this.textColor,
    this.color,
    this.size,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: size ?? const Size(double.maxFinite, 50),
          backgroundColor: color ?? ApplicationTheme.red,
        ),
        onPressed: onPressed,
        child: CustomText(
          text: label,
          color: textColor ?? ApplicationTheme.white,
        ),
      ),
    );
  }
}
