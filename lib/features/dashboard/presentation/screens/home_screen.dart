import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/dashboard_dots.dart';

import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Map<String, String>> categories = [
    {"icon": '', "title": "All"},
    {"icon": AppConstant.burgerIconPathPG, "title": "Burger"},
    {"icon": AppConstant.hotDogIconPathPG, "title": "Sandwich"},
    {"icon": AppConstant.pizzaIconPathPG, "title": "Pizza"},
  ];

  List<String> offers = [
    'assets/icons/group_offer.png',
    'assets/icons/group_offer.png',
    'assets/icons/group_offer.png',
    'assets/icons/group_offer.png',
    'assets/icons/group_offer.png',
  ];
  int isTapped = 0;
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageOffer = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 18),
          vertical: responsiveHeight(context, 12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
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
                  child: SvgPicture.asset(AppConstant.locationIconPath),
                ),
              ),
              title: Row(
                children: [
                  Text(
                    'Current Location',
                    style: TextStyle(color: AppColors.greyC),
                  ),
                  SizedBox(width: responsiveWidth(context, 5)),
                  Container(
                    height: responsiveHeight(context, 18),
                    width: responsiveWidth(context, 18),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(AppConstant.currentLocationPath),
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                'Jl. Soekarno Hatta 15A Malang',
                style: TextStyle(color: Colors.black),
              ),
              trailing: Container(
                height: responsiveHeight(context, 34),
                width: responsiveWidth(context, 34),
                decoration: BoxDecoration(color: AppColors.lightGrey),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppConstant.notificationEmpty),
                ),
              ),
            ),

            SizedBox(height: responsiveHeight(context, 20)),

            SearchBar(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>((
                Set<MaterialState> states,
              ) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(color: AppColors.midGrey, width: 1.0),
                );
              }),
              backgroundColor: WidgetStateColor.resolveWith(
                (states) => Colors.white,
              ),
              hintText: 'Search menu, restaurant or etc',
              shadowColor: WidgetStateColor.transparent,

              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppConstant.searchIcon),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 30)),
            SizedBox(
              height: responsiveHeight(context, 50),
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 15),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        isTapped = index;
                        print('debugging :{$index} ');
                        //TODO: smth
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isTapped == index
                                  ? AppColors.green
                                  : Colors.white,
                          border: Border.all(
                            color:
                                isTapped == index
                                    ? AppColors.green
                                    : AppColors.lightGreen,
                          ),
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: responsiveWidth(context, 15)),

                            if (categories[index]['icon'] != '')
                              Image.asset(
                                categories[index]['icon']!,
                                fit: BoxFit.contain,
                              ),

                            SizedBox(width: responsiveWidth(context, 15)),
                            Text(
                              categories[index]['title']!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color:
                                    isTapped == index
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                            SizedBox(width: responsiveWidth(context, 15)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: responsiveHeight(context, 15)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: SizedBox(
                height: responsiveHeight(context, 137),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: offers.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    _currentPageOffer.value = index;
                  },

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 5),
                      ),
                      child: Image.asset(offers[index]),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                offers.length,
                (index) => ValueListenableBuilder<int>(
                  valueListenable: _currentPageOffer,
                  builder: (context, value, child) {
                    return DashboardDot(isActive: value == index);
                  },
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 10)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Row(
                children: [
                  Text(
                    'Top Rated',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: responsiveHeight(context, 10)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.midYellow),
                      Text('3.5'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
