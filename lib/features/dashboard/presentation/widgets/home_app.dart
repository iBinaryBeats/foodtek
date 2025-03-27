import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../widgets/bottomsheet/notification_bottom_sheet.dart';

class HomeAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String locationIconPath;
  final String currentLocationIconPath;
  final String notificationIconPath;

  const HomeAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.locationIconPath,
    required this.currentLocationIconPath,
    required this.notificationIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: responsiveHeight(context, 50)),

        ListTile(
          leading: Container(
            height: responsiveHeight(context, 34),
            width: responsiveWidth(context, 34),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(locationIconPath),
            ),
          ),
          title: Row(
            children: [
              Text(title, style: TextStyle(color: AppColors.greyC)),
              SizedBox(width: responsiveWidth(context, 5)),
              Container(
                height: responsiveHeight(context, 18),
                width: responsiveWidth(context, 18),
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(currentLocationIconPath),
                ),
              ),
            ],
          ),
          subtitle: Text(subtitle, style: TextStyle(color: Colors.black)),
          trailing: Container(
            height: responsiveHeight(context, 34),
            width: responsiveWidth(context, 34),
            decoration: BoxDecoration(color: AppColors.lightGrey),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return NotificationBottomSheet(title: 'Notifications');
                  },
                );
              },
              icon: SvgPicture.asset(notificationIconPath),
            ),
          ),
        ),

        SizedBox(height: responsiveHeight(context, 10)),
      ],
    );
  }
}
