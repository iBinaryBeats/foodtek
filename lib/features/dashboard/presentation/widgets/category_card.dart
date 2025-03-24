import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';
import '../../../../core/utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  final bool isFavourite;

  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.isFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: AppColors.lightGreen),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: -15,

          right: responsiveWidth(context, 65),
          child: CircleAvatar(
            backgroundColor: Color(0xffEEEEEE),
            radius: 35,
            child: Image.asset('assets/icons/burger_meal.png'),
          ),
        ),
        Positioned(
          top: -9,

          right: responsiveWidth(context, 0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {
                //TODO
              },
              icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_border,
                color: isFavourite ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),

        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  this.title,
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  this.description,
                  style: TextStyle(fontSize: 8.sp, color: Colors.grey),
                ),
              ),
              Text(
                '\$' + this.price.toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Poppins-Regular',

                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: -15,
          left: MediaQuery.sizeOf(context).width * 0.14 / 2,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ElevatedButton(
                onPressed: () {
                  //TODO
                },
                child: Text('Order Now'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.green,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
