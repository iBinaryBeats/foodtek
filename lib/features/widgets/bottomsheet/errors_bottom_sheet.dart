import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';

import '../../../core/utils/responsive.dart';

class ErrorsBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final String iconPath;
  final Color buttonColor;
  final VoidCallback onTap;

  const ErrorsBottomSheet({
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
        minHeight: responsiveHeight(context, 400),
        minWidth: responsiveWidth(context, 430),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: responsiveHeight(context, 25)),
            SvgPicture.asset(iconPath),
            SizedBox(height: responsiveHeight(context, 15)),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: responsiveHeight(context, 15)),
            Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontFamily: 'Ubuntu',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsiveHeight(context, 25)),
            CustomButton(
              text: 'Continue',
              textColor: Colors.white,
              onPressed: () => Navigator.pop(context),
              buttonColor: Color(0xffcc2d35),
            ),
          ],
        ),
      ),
    );
  }
}
