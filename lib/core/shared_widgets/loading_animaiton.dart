import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/colors.dart';

class ThreeDotsLoadingWidget extends StatelessWidget {
  const ThreeDotsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom:8),
      color: Colors.transparent,
      child: const SpinKitChasingDots(
        color: primaryColor,
        size: 50.0,
      ),
    );
  }
}
