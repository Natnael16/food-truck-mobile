import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class ToggleButton extends StatefulWidget {
  final ValueChanged<bool> onToggleChanged;
  bool value;

  ToggleButton({
    Key? key,
    required this.onToggleChanged,
    this.value = false,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: primaryColor.withOpacity(0.5) ,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "All Food Truck",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.value ? white.withOpacity(0.5) : white,
                  ),
            ),
            Transform.scale(
              scale: 1.1,
              child: Switch(
                value: widget.value,
                trackOutlineColor: MaterialStateProperty.all(
                  widget.value ? primaryColor : black.withOpacity(0.5),
                ),
                thumbColor: MaterialStateProperty.all(Colors.white),
                activeColor: primaryColor,
                inactiveTrackColor: const Color.fromARGB(255, 225, 225, 225),
                onChanged: (value) {
                  setState(() {
                    widget.value = value;
                  });
                  widget.onToggleChanged(widget.value);
                },
              ),
            ),
            Text(
              "Available only",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.value ? white : white.withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}