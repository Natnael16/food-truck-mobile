import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widgets/custom_button.dart';

class RadiusSelectionWidget extends StatefulWidget {
  final int selectedRadius;
  final Function(int) onRadiusSelected;
  final Function() onSet;

  RadiusSelectionWidget({
    required this.selectedRadius,
    required this.onRadiusSelected,
    required this.onSet,
  });

  @override
  _RadiusSelectionWidgetState createState() => _RadiusSelectionWidgetState();
}

class _RadiusSelectionWidgetState extends State<RadiusSelectionWidget> {
  late int _selectedRadius;

  @override
  void initState() {
    super.initState();
    _selectedRadius = widget.selectedRadius;
  }

  void incrementRadius() {
    setState(() {
      _selectedRadius = _selectedRadius + 1;
    });
    widget.onRadiusSelected(_selectedRadius);
  }

  void decrementRadius() {
    if (_selectedRadius > 0) {
      setState(() {
        _selectedRadius = _selectedRadius - 1;
      });
      widget.onRadiusSelected(_selectedRadius);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Choose Radius',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrementRadius,
                icon: const Icon(Icons.remove, size: 30),
              ),
              Text(
                '$_selectedRadius KM',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: incrementRadius,
                icon: const Icon(Icons.add, size : 30),
              ),
            ],
          ),
          SizedBox(height: 5),
          CustomButton(
            width: 80,
            height: 35,
            text: "Set",
            onTap: widget.onSet,
          ),
        ],
      ),
    );
  }
}
