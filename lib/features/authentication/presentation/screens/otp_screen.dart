import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SvgPicture.asset(AppConstant.patternPath),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: responsiveHeight(context, 70)),
                SvgPicture.asset(AppConstant.logoPath),
                SizedBox(height: responsiveHeight(context, 46)),
                Container(
                  width: responsiveWidth(context, 343),
                  height: responsiveHeight(context, 417),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(AppConstant.iconBackPath),
                            ),
                          ],
                        ),
                        Text('Rest Password'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
