import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import 'dashboard_dots.dart';
import 'dashboard_title.dart';
import 'food_card.dart';
import 'food_grid_view.dart';

class DashboardSection extends StatelessWidget {
  final ValueNotifier<int> selectedIndexNotifier;
  final ValueNotifier<String> selectedCategoryNotifier;
  final ValueNotifier<int> currentPageNotifier;
  final List<Map<dynamic, dynamic>> categories;
  final List<String> offers;
  final List<Map<dynamic, dynamic>> foodItems;
  final List<Map<dynamic, dynamic>> recommItems;
  final PageController pageController;

  const DashboardSection({
    Key? key,
    required this.selectedIndexNotifier,
    required this.selectedCategoryNotifier,
    required this.currentPageNotifier,
    required this.categories,
    required this.offers,
    required this.foodItems,
    required this.recommItems,
    required this.pageController,
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

class OffersCarousel extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: responsiveHeight(context, 137),
          child: PageView.builder(
            controller: pageController,
            itemCount: offers.length,
            onPageChanged: (index) => currentPageNotifier.value = index,
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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            offers.length,
            (index) => ValueListenableBuilder<int>(
              valueListenable: currentPageNotifier,
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
