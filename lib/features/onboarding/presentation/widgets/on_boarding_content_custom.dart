import 'package:flutter_svg/svg.dart';
import 'package:foodtek/features/onboarding/domain/entities/on_boarding_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class OnBoardingContentCustom extends StatelessWidget {
  final OnBoardingCard card;
  final VoidCallback onContinue;

  OnBoardingContentCustom({required this.card, required this.onContinue});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(card.imagePath ?? ''),
        SizedBox(height: responsiveHeight(context, 45)),
        Text(
          card.title ?? '',
          style: const TextStyle(
            fontSize: 32,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppColors.greyC,
          ),
        ),
        SizedBox(height: responsiveHeight(context, 8)),
        Text(
          card.descirption ?? '',
          style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: responsiveHeight(context, 85)),

        // Continue button
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
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Continue'),
          ),
        ),
      ],
    );
  }
}
