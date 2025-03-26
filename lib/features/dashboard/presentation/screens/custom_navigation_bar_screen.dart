import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/features/dashboard/presentation/screens/favorites_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/history_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/home_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/profile_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class NavigationBarScreen extends StatefulWidget {
  final int initialPage;

  const NavigationBarScreen({super.key, this.initialPage = 0});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarScreen> {
  late int currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(displayDash: 0),
      HomeScreen(displayDash: 1),
      ProfileScreen(),

      HistoryScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: pages[currentPage],
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Color(0xffDBF4D1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {
              //TODO:Navigate to :
            },
            backgroundColor: AppColors.green,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  75,
                ), // This makes the icon background circular
              ),
              child: SvgPicture.asset(
                AppConstant.buyIcon,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xffDBF4D1),
          selectedItemColor: Color(0xff25AE4B),
          unselectedItemColor: Color(0xff484C52),
          iconSize: 25,
          currentIndex: currentPage,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppConstant.homeIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: const ColorFilter.mode(
                  Color(0xff484C52),
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppConstant.homeIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppConstant.favIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: const ColorFilter.mode(
                  Color(0xff484C52),
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppConstant.favIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '',
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: const ColorFilter.mode(
                  Color(0xff484C52),
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                '',
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppConstant.historyIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: const ColorFilter.mode(
                  Color(0xff484C52),
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppConstant.historyIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppConstant.profileIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: const ColorFilter.mode(
                  Color(0xff484C52),
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppConstant.profileIcon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
