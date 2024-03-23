import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class CircleButton extends StatelessWidget {
  CircleButton(
      {super.key,
       this.icon,
      this.imageIcon,
      this.shadow = false,
      this.size = 60,
      required this.backgroundColor,
      this.onTap});

  final IconData? icon;
  final Color backgroundColor;
  final VoidCallback? onTap;
  bool shadow;
  double size;
  Widget? imageIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            if (shadow)
              const BoxShadow(color: grey, blurRadius: 3, offset: Offset(0, 3))
          ],
          color: backgroundColor,
        ),
        child: imageIcon ?? Icon(icon, color: white),
      ),
    );
  }
}
