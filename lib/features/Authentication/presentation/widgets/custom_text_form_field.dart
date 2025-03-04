import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomLabel extends StatelessWidget {
  final String text;

  const CustomLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: AppColors.greyC, // Make sure AppColors is accessible
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
