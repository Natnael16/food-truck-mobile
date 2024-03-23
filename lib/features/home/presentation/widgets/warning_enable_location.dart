import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/theme/colors.dart';

class LocationWarning extends StatelessWidget {
   LocationWarning(
      {super.key, required this.onCancelPressed, required this.onEnablePressed});
  void Function() onCancelPressed;
  void Function() onEnablePressed;

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Plus Jakarta Sans",
        );
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      shadowColor: white,
      content: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(14)),
          height: 38.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.warning,size: 80,color: Colors.yellow),
              Text("Please enable location permission to use the map.",
                  textAlign: TextAlign.center, style: textStyle),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      text: "Enable",
                      radius: 7,
                      width: 30.w,
                      onTap: onEnablePressed),
                  CustomButton(
                      text: "Not now",
                      radius: 7,
                      width: 30.w,
                      onTap: onCancelPressed),
                ],
              ),
              SizedBox(height: 2.h),
            ],
          )),
    );
  }
}
