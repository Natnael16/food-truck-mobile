import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool isPassword;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool readOnly;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.label,
      this.suffix,
      this.isPassword = false,
      this.readOnly = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(1,2),spreadRadius: 2)
          ]

        ),
        child: TextFormField(
          obscureText: isPassword,
          controller: controller,
          validator: validator,
          readOnly: readOnly,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: black),
          decoration: InputDecoration(
            hintText: label ?? 'Enter name, location, or food keyword',
            hintStyle:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: grey),
            suffixIcon: suffix,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.circular(12.0), // Adjust the radius here
            ),
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(18.0),
          ),
        ),
      ),
    );
  }
}
