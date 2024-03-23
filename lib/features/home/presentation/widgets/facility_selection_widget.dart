import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class FacilityTypeSelector extends StatefulWidget {
  final String selectedFacility;
  final Function(String) onSelected;

  FacilityTypeSelector(
      {required this.selectedFacility, required this.onSelected});

  @override
  _FacilityTypeSelectorState createState() => _FacilityTypeSelectorState();
}

class _FacilityTypeSelectorState extends State<FacilityTypeSelector> {
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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Facility Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  widget.onSelected('Truck');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Truck',
                      style: TextStyle(
                        color: widget.selectedFacility == 'Truck'
                            ? primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  widget.onSelected('Push Cart');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Push Cart',
                      style: TextStyle(
                        color: widget.selectedFacility == 'Push Cart'
                            ? primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
