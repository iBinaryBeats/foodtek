import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';

class OnBoardingDot extends StatelessWidget {
  final bool isActive;

  const OnBoardingDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.green : AppColors.greyC,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
