import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/responsive.dart';
import 'dashboard_dots.dart';
import 'dashboard_title.dart';
import 'food_card.dart';
import 'food_grid_view.dart';

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

final PageController _pageController = PageController();
final ValueNotifier<int> isTapped = ValueNotifier<int>(0);
final ValueNotifier<String> selectedCategory = ValueNotifier<String>('All');
final ValueNotifier<int> _currentPageOffer = ValueNotifier<int>(0);
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

class DashboardSection extends StatelessWidget {
  final ValueNotifier<int> selectedIndexNotifier;
  final ValueNotifier<String> selectedCategoryNotifier;
  final ValueNotifier<int> currentPageNotifier = ValueNotifier(0);
  final List<Map<dynamic, dynamic>> categories;
  final List<String> offers;
  final List<Map<dynamic, dynamic>> foodItems;
  final List<Map<dynamic, dynamic>> recommItems;
  final PageController pageController = PageController();

  DashboardSection({
    Key? key,
    required this.selectedIndexNotifier,
    required this.selectedCategoryNotifier,
    required this.categories,
    required this.offers,
    required this.foodItems,
    required this.recommItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: responsiveHeight(context, 10)),
        CategorySelector(
          categories: categories,
          selectedIndexNotifier: selectedIndexNotifier,
          selectedCategoryNotifier: selectedCategoryNotifier,
        ),
        SizedBox(height: responsiveHeight(context, 5)),
        ValueListenableBuilder<String>(
          valueListenable: selectedCategoryNotifier,
          builder: (context, category, child) {
            if (category == 'All') {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OffersCarousel(
                    offers: offers,
                    pageController: pageController,
                    currentPageNotifier: currentPageNotifier,
                  ),
                  SizedBox(height: responsiveHeight(context, 10)),
                  CustomTitle(text: 'Top Rated'),
                  SizedBox(height: responsiveHeight(context, 10)),
                  HorizontalFoodScroll(foodItems: foodItems),
                  RecommendSection(recommItems: recommItems),
                ],
              );
            } else {
              return FoodGridView(foodItems: foodItems);
            }
          },
        ),
      ],
    );
  }
}

class CategorySelector extends StatelessWidget {
  final List<Map<dynamic, dynamic>> categories;
  final ValueNotifier<int> selectedIndexNotifier;
  final ValueNotifier<String> selectedCategoryNotifier;

  const CategorySelector({
    Key? key,
    required this.categories,
    required this.selectedIndexNotifier,
    required this.selectedCategoryNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveHeight(context, 35),
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, selectedIndex, _) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 15),
                ),
                child: GestureDetector(
                  onTap: () {
                    selectedIndexNotifier.value = index;
                    selectedCategoryNotifier.value =
                        categories[index]['title']!;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.green : Colors.white,
                      border: Border.all(
                        color:
                            isSelected ? AppColors.green : AppColors.lightGreen,
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
                            fontWeight: FontWeight.w700,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(width: responsiveWidth(context, 15)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class OffersCarousel extends StatefulWidget {
  final List<String> offers;
  final PageController pageController;
  final ValueNotifier<int> currentPageNotifier;

  const OffersCarousel({
    Key? key,
    required this.offers,
    required this.pageController,
    required this.currentPageNotifier,
  }) : super(key: key);

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startAutoIncrement();
  }

  // Function to auto-increment the page view
  void _startAutoIncrement() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int nextPage = widget.currentPageNotifier.value + 1;
      if (nextPage >= widget.offers.length) {
        nextPage = 0; // Reset to the first page after the last one
      }
      widget.pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
      widget.currentPageNotifier.value = nextPage; // Update the current page
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: responsiveHeight(context, 137),
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.offers.length,
            onPageChanged: (index) => widget.currentPageNotifier.value = index,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 5),
                ),
                child: Image.asset(widget.offers[index]),
              );
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            widget.offers.length,
            (index) => ValueListenableBuilder<int>(
              valueListenable: widget.currentPageNotifier,
              builder: (context, value, child) {
                return DashboardDot(isActive: value == index);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalFoodScroll extends StatelessWidget {
  final List<Map<dynamic, dynamic>> foodItems;

  const HorizontalFoodScroll({Key? key, required this.foodItems})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          foodItems.length,
          (index) => Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: FoodCard(
              image: foodItems[index]['image'],
              title: foodItems[index]['title'],
              description: foodItems[index]['description'],
              rating: foodItems[index]['rating'],
              price: foodItems[index]['price'],
            ),
          ),
        ),
      ),
    );
  }
}

class RecommendSection extends StatelessWidget {
  final List<Map<dynamic, dynamic>> recommItems;

  const RecommendSection({Key? key, required this.recommItems})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 8),
          ),
          child: Row(
            children: [
              Text(
                'Recommend',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_right, color: AppColors.green),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(recommItems.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.asset(recommItems[index]['imagePath']),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          color: AppColors.green,
                          child: Text(
                            '\$${recommItems[index]['price']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
