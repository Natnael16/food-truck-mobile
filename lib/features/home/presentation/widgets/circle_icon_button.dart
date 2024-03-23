import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Widget child;

  const CircleIconButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Center(child: child),
    );
  }
}
