import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/responsive.dart';

class NotificationBottomSheet extends StatelessWidget {
  final String title;

  const NotificationBottomSheet({Key? key, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      constraints: BoxConstraints(
        minHeight: responsiveHeight(context, 550),
        minWidth: responsiveWidth(context, 430),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: responsiveHeight(context, 25)),
          //      SvgPicture.asset(iconPath),
          SizedBox(height: responsiveHeight(context, 15)),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 18),
              ),

              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: responsiveHeight(context, 15)),
          // Text(
          //   message,
          //   style: TextStyle(fontSize: 16.sp, color: Colors.black),
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(height: responsiveHeight(context, 25)),
        ],
      ),
    );
  }
}
