import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodtek/features/onboarding/domain/entities/on_boarding_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class OnBoardingContent extends StatelessWidget {
  final OnBoardingCard card;
  final VoidCallback onContinue;

  OnBoardingContent({required this.card, required this.onContinue});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: responsiveHeight(context, 328),
          width: responsiveWidth(context, 328),
          child: SvgPicture.asset(card.imagePath ?? ''),
        ),
        SizedBox(height: responsiveHeight(context, 45)),
        Text(
          card.title ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: AppColors.greyC,
          ),
        ),
        SizedBox(height: responsiveHeight(context, 8)),
        Text(
          card.descirption ?? '',
          style: TextStyle(fontSize: 12.sp, fontFamily: 'Inter'),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: responsiveHeight(context, 85)),
        Container(
          width: responsiveWidth(context, 307),
          height: responsiveHeight(context, 48),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff25AE4B), Color(0xff0F481F)],
            ),
            borderRadius: BorderRadius.circular(30),
          ),

          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: const Text('Continue'),
          ),
        ),
      ],
    );
  }
}
