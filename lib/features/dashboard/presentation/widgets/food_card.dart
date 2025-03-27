import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/dashboard/presentation/screens/home_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/order_now.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/food_item_datails_widget.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/search_bar_widget.dart';

import '../screens/custom_navigation_bar_screen.dart';

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double rating;
  final double price;

  const FoodCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: responsiveWidth(context, 155),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.lightGreen),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffFF9F06)),
                  SizedBox(width: 5.w),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontFamily: 'AveriaSerifLibre',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Center(child: Image.asset(image)),
              SizedBox(height: 5.h),

              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                description,
                maxLines: 2,
                style: TextStyle(fontSize: 6.sp, color: Colors.grey),
              ),
              SizedBox(height: responsiveHeight(context, 1)),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$ ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Poppins-Regular',

                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                        TextSpan(
                          text: '${price.floor()}.',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Poppins-Regular',

                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                        TextSpan(
                          text: price.toStringAsFixed(2).split('.')[1],
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => FoodItemDetails(
                                imageUrl: 'assets/images/order_now',
                                foodName: 'foodName',
                                rating: 4,
                                reviewsCount: 5,
                                price: 5,
                                originalPrice: 5,
                                description: 'description',
                              ),
                        ),
                      );
                    },
                    icon: Icon(Icons.add_circle_rounded), // Corrected here
                    color: AppColors.green,
                    iconSize: 18.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
