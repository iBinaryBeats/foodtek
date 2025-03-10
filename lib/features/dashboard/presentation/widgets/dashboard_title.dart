import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/utils/responsive.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double horizontalPadding;

  const CustomTitle({
    Key? key,
    required this.text,
    this.fontSize = 20.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w600,
    this.horizontalPadding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, horizontalPadding),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
