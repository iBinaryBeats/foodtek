import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/dashboard_dots.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/dashboard_title.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/food_card.dart';

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

  List<Map<dynamic, dynamic>> foodItems = [
    {
      "image": "assets/icons/burger_meal.png",
      "title": "Chicken Burger",
      "description": "100 gr chicken + tomato + cheese Lettuce",
      "rating": 3.5,
      "price": 20.80,
    },
    {
      "image": "assets/icons/cheese_burger.png",
      "title": "Cheese Burger",
      "description": "100 gr meat + onion + tomato + Lettuce cheese",
      "rating": 4.5,
      "price": 15.35,
    },
    {
      "image": "assets/icons/cheese_burger.png",
      "title": "Pepperoni Pizza",
      "description": "Mozzarella cheese + pepperoni + tomato sauce",
      "rating": 4.8,
      "price": 25.00,
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

  int isTapped = 0;
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageOffer = ValueNotifier<int>(0);

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: responsiveHeight(context, 40)),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppConstant.notificationEmpty),
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
              SizedBox(height: responsiveHeight(context, 10)),
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
              SizedBox(height: responsiveHeight(context, 5)),
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
              CustomTitle(text: 'Top Rated'),
              SizedBox(height: responsiveHeight(context, 10)),

              SizedBox(
                height: responsiveHeight(context, 200),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      foodItems.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          right: 10.w,
                        ), // Add spacing between items
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
                ),
              ),

              // SizedBox(
              //   height: responsiveHeight(context, 209),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: foodItems.length,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: responsiveWidth(context, 10),
              //     ),
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: responsiveWidth(context, 5),
              //         ),
              //         child: FoodCard(
              //           image: foodItems[index]['image'],
              //           title: foodItems[index]['title'],
              //           description: foodItems[index]['description'],
              //           rating: foodItems[index]['rating'],
              //           price: foodItems[index]['price'],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: responsiveHeight(context, 5)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 8),
                ),
                child: Row(
                  children: [
                    Text(
                      'Recommend',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        //TODO
                      },
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
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: responsiveHeight(context, 109),
                child: ListView.builder(
                  itemCount: recommItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.r),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(recommItems[index]['imagePath']),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '\$' +
                                        recommItems[index]['price'].toString(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 8.sp,
                                      backgroundColor: AppColors.green,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
