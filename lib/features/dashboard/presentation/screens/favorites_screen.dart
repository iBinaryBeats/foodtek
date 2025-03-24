import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/food_grid_view.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  //assuming all values fetched here are FAV_ITEMs
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Favorites',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            FoodGridView(foodItems: foodItems),
          ],
        ),
      ),
    );
  }
}
