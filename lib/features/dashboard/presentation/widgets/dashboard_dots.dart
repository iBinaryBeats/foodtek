import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';

class DashboardDot extends StatelessWidget {
  final bool isActive;

  const DashboardDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 5,
      width: 20,
      decoration: BoxDecoration(
        color: isActive ? AppColors.green : Color(0xffDBF4D1),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
