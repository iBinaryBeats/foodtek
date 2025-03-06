import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';

import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  /*
  List<Map<String, String>> categories = [
    {"icon": '', "title": "All"},
    {"icon": AppConstant.burgerIconPath, "title": "Burger"},
    {"icon": AppConstant.pizzaIconPath, "title": "Pizza"},
    {"icon": AppConstant.hotDogIconPath, "title": "Sandwich"},
  ];


 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            SizedBox(height: responsiveHeight(context, 25)),
            /*  Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            categories[index]['icon']!.isNotEmpty
                                ? SvgPicture.asset(categories[index]['icon']!)
                                : SizedBox.shrink(), // Avoids empty SVG error
                            SizedBox(width: 8),
                            Text(categories[index]['title']!),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
