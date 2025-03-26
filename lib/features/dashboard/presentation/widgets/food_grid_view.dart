import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive.dart';
import 'category_card.dart';

class FoodGridView extends StatelessWidget {
  final List<Map<dynamic, dynamic>> foodItems;

  const FoodGridView({Key? key, required this.foodItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 8)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 50.h,
          childAspectRatio: 0.75,
        ),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            image: foodItems[index]['image'],
            title: foodItems[index]['title'],
            description: foodItems[index]['description'],
            price: foodItems[index]['price'],
            isFavourite: foodItems[index]['isFavourite'],
          );
        },
      ),
    );
  }
}
