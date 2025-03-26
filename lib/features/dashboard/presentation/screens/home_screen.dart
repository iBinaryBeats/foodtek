import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/dashboard/presentation/screens/favorites_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/history_screen.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/category_card.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/dashboard_dots.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/home_section.dart';
import 'package:foodtek/features/widgets/bottomsheet/notification_bottom_sheet.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/food_card.dart';
import '../widgets/food_grid_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.displayDash});
  int displayDash = 0;
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

  List<Map<dynamic, dynamic>> recommItems = [
    {'imagePath': 'assets/images/item1.png', 'price': 103.00},
    {'imagePath': 'assets/images/item2.png', 'price': 50.00},
    {'imagePath': 'assets/images/item3.png', 'price': 12.99},
    {'imagePath': 'assets/images/item1.png', 'price': 103.00},
    {'imagePath': 'assets/images/item2.png', 'price': 50.00},
    {'imagePath': 'assets/images/item3.png', 'price': 12.99},
    {'imagePath': 'assets/images/item4.png', 'price': 8.20},
    {'imagePath': 'assets/images/item4.png', 'price': 8.20},
  ];

  final ValueNotifier<int> isTapped = ValueNotifier<int>(0);
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageOffer = ValueNotifier<int>(0);
  final ValueNotifier<String> selectedCategory = ValueNotifier<String>(
    'All',
  ); // Use ValueNotifier

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 18),
          vertical: responsiveHeight(context, 12),
        ),
        child: SingleChildScrollView(
          child: Column(
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
                        child: SvgPicture.asset(
                          AppConstant.currentLocationPath,
                        ),
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
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return NotificationBottomSheet(
                            title: 'Notifications',
                          );
                        },
                      );
                    },
                    icon: SvgPicture.asset(AppConstant.notificationEmpty),
                  ),
                ),
              ),

              SizedBox(height: responsiveHeight(context, 10)),

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
              if (displayDash == 0)
                DashboardSection(
                  selectedIndexNotifier: isTapped,
                  selectedCategoryNotifier: selectedCategory,
                  currentPageNotifier: _currentPageOffer,
                  categories: categories,
                  offers: offers,
                  foodItems: foodItems,
                  recommItems: recommItems,
                  pageController: _pageController,
                ),

              if (displayDash == 1)
                Column(
                  children: [
                    SizedBox(height: responsiveHeight(context, 25)),
                    Row(
                      children: [
                        Text(
                          'Favorites',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    FoodGridView(foodItems: foodItems),
                    SizedBox(height: responsiveHeight(context, 20)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
