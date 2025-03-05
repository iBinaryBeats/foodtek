import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? imagePath;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.onPressed,
    required this.buttonColor,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(context, 295),
      height: responsiveHeight(context, 48),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.white60,
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null) ...[
              SvgPicture.asset(imagePath ?? ''),
              SizedBox(
                width: responsiveWidth(context, 10),
              ), // Space between icon and text
            ],
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
