import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final double radius;
  final String text;
  final double? width;
  final double? height;

  const CustomButton(
      {super.key,
      required this.onTap,
      this.radius = 10,
      required this.text,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width ?? 65.w,
          height: height ?? 6.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  offset: const Offset(1, 2),
                  color: black.withOpacity(0.2),
                  spreadRadius: 3)
            ],
            borderRadius: BorderRadius.circular(radius),
            color: white,
          ),
          child: Center(
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: primaryColor)))),
    );
  }
}
