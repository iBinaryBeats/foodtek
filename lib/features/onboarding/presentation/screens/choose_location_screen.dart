import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/Authentication/presentation/screens/login_screen.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/icons/location_selection.png'),
          SizedBox(height: responsiveHeight(context, 45)),
          Text(
            'Turn On Your Location',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: AppColors.textColorGrey,
            ),
          ),
          SizedBox(height: responsiveHeight(context, 8)),
          Text(
            textAlign: TextAlign.center,
            'To Continues, Let Your Device Turn\nOn Location, Which Uses Google’s\nLocation Service',
            style: TextStyle(color: AppColors.textColorGrey, fontSize: 14.sp),
          ),
          SizedBox(height: responsiveHeight(context, 35)),
          Container(
            width: responsiveWidth(context, 307),
            height: responsiveHeight(context, 48),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff25AE4B), Color(0xff0F481F)],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: ElevatedButton(
              onPressed: () {
                //TODO
              },
              child: Text(
                'Yes, Turn It On',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shadowColor: Colors.transparent,
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 12)),
          Container(
            width: responsiveWidth(context, 307),
            height: responsiveHeight(context, 48),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColorGrey,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffC2C2C2),
                foregroundColor: AppColors.textColorGrey,
                shadowColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
