import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive.dart';
import 'food_grid_view.dart'; // Import the FoodGridView widget

class CustomFavoritesSection extends StatelessWidget {
  final String title;

  const CustomFavoritesSection({Key? key, this.title = 'Favorites'})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> foodItems = [
      {
        "image": "assets/icons/burger_meal.png",
        "title": "Chicken Burger",
        "description": "100 gr chicken + tomato + cheese Lettuce",
        "rating": 3.5,
        "price": 20.80,
        "isFavourite": true,
      },
      {
        "image": "assets/icons/cheese_burger.png",
        "title": "Cheese Burger",
        "description": "100 gr meat + onion + tomato + Lettuce cheese",
        "rating": 4.5,
        "price": 15.35,
        "isFavourite": false,
      },
      {
        "image": "assets/icons/cheese_burger.png",
        "title": "Cheese Burger",
        "description": "100 gr meat + onion + tomato + Lettuce cheese",
        "rating": 4.5,
        "price": 15.35,
        "isFavourite": false,
      },
      {
        "image": "assets/icons/cheese_burger.png",
        "title": "Cheese Burger",
        "description": "100 gr meat + onion + tomato + Lettuce cheese",
        "rating": 4.5,
        "price": 15.35,
        "isFavourite": false,
      },
      {
        "image": "assets/icons/cheese_burger.png",
        "title": "Cheese Burger",
        "description": "100 gr meat + onion + tomato + Lettuce cheese",
        "rating": 4.5,
        "price": 15.35,
        "isFavourite": false,
      },
      {
        "image": "assets/icons/cheese_burger.png",
        "title": "Pepperoni Pizza",
        "description": "Mozzarella cheese + pepperoni + tomato sauce",
        "rating": 4.8,
        "price": 25.00,
        "isFavourite": false,
      },
    ];

    return Column(
      children: [
        SizedBox(height: responsiveHeight(context, 25)),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:
                    20.sp, // Assuming 20.sp is working with your text scale factor
              ),
            ),
          ],
        ),
        FoodGridView(foodItems: foodItems),
        SizedBox(height: responsiveHeight(context, 20)),
      ],
    );
  }
}
