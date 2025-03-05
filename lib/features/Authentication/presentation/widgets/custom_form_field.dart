import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/responsive.dart';

import '../../../../core/utils/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;

  const CustomFormField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.hintText,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.greyC,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),

        Container(
          width: responsiveWidth(context, 295),
          height: responsiveHeight(context, 46),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: hintText,
              labelStyle: const TextStyle(fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
