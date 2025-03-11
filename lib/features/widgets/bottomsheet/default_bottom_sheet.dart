import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/responsive.dart';

class DefaultBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final String iconPath;
  final Color buttonColor;
  final VoidCallback onTap;

  const DefaultBottomSheet({
    Key? key,
    required this.title,
    required this.message,
    required this.iconPath,
    this.buttonColor = Colors.red,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      constraints: BoxConstraints(
        minHeight: responsiveHeight(context, 372),
        minWidth: responsiveWidth(context, 430),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: responsiveHeight(context, 25)),
          SvgPicture.asset(iconPath),
          SizedBox(height: responsiveHeight(context, 15)),
          Text(title, style: const TextStyle(fontSize: 24)),
          SizedBox(height: responsiveHeight(context, 15)),
          Text(
            message,
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsiveHeight(context, 25)),
        ],
      ),
    );
  }
}
