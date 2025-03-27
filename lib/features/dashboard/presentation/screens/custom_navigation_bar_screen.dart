import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/features/dashboard/presentation/screens/favorites_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/history_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/home_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/profile_screen.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/food_item_datails_widget.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/home_app.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/favourite_screen_customized.dart';
import '../widgets/home_section.dart';
import '../widgets/search_bar_widget.dart';

class NavigationBarScreen extends StatefulWidget {
  final int initialPage;

  const NavigationBarScreen({super.key, this.initialPage = 0});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarScreen> {
  late int currentPage;
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

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(displayDash: 0),
      HomeScreen(displayDash: 1),
      HomeScreen(displayDash: 2),
      ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body:
          currentPage == 3
              ? _bottomBarBody()
              : Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeAppBar(
                        title: 'Current Location',
                        subtitle: 'Jl. Soekarno Hatta 15A Malang',
                        locationIconPath: AppConstant.locationIconPath,
                        currentLocationIconPath:
                            AppConstant.currentLocationPath,
                        notificationIconPath: AppConstant.notificationEmpty,
                      ),
                      CustomSearchBar(),
                      _bottomBarBody(),
                      SizedBox(height: responsiveHeight(context, 22)),
                    ],
                  ),
                ),
              ),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBarScreenItems(
        currentPage: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }

  Widget _bottomBarBody() {
    switch (currentPage) {
      case 0:
        return DashboardSection(
          selectedIndexNotifier: isTapped,
          selectedCategoryNotifier: selectedCategory,
          categories: categories,
          offers: offers,
          foodItems: foodItems,
          recommItems: recommItems,
        );

      case 1:
        return CustomFavoritesSection(title: 'Favourite');

      case 3:
        return ProfileScreen();

      //case 5:
      //return FilterWidget(context: context);
      // case 2:
      //   return FoodItemDetails(
      //     imageUrl: 'assets/images/order_now',
      //     foodName: 'foodName',
      //     rating: 4,
      //     reviewsCount: 5,
      //     price: 5,
      //     originalPrice: 5,
      //     description: 'description',
      //   );
      default:
        return SizedBox();
    }
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffDBF4D1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            //TODO:Navigate to :
          },
          backgroundColor: AppColors.green,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                75,
              ), // This makes the icon background circular
            ),
            child: SvgPicture.asset(AppConstant.buyIcon, width: 24, height: 24),
          ),
        ),
      ),
    );
  }
}

// class FilterWidget extends StatelessWidget {
//   const FilterWidget({super.key, required this.context});
//
//   final BuildContext context;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               'Filter',
//               style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
//             ),
//           ],
//         ),
//         SizedBox(height: responsiveHeight(context, 5)),
//         Row(
//           children: [
//             Text('Price Range', style: TextStyle(color: Colors.grey[500])),
//           ],
//         ),
//         SizedBox(height: responsiveHeight(context, 5)),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Min', // Keeps text in place without moving
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green, width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.green,
//                       width: 2,
//                     ), // More emphasis on tap
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: responsiveWidth(context, 15)),
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Max',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green, width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green, width: 2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

class CustomNavigationBarScreenItems extends StatefulWidget {
  const CustomNavigationBarScreenItems({
    super.key,
    required this.currentPage,
    required this.onTap,
  });

  final int currentPage;
  final Function(int index) onTap;

  @override
  State<CustomNavigationBarScreenItems> createState() =>
      _CustomNavigationBarScreenItemsState();
}

class _CustomNavigationBarScreenItemsState
    extends State<CustomNavigationBarScreenItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Color(0xffDBF4D1),
        selectedItemColor: Color(0xff25AE4B),
        unselectedItemColor: Color(0xff484C52),
        iconSize: 25,
        currentIndex: widget.currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: widget.onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppConstant.homeIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: const ColorFilter.mode(
                Color(0xff484C52),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppConstant.homeIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppConstant.favIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: const ColorFilter.mode(
                Color(0xff484C52),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppConstant.favIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
            ),
            label: 'Favorites',
          ),

          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     '',
          //     width: responsiveWidth(context, 24),
          //     height: responsiveHeight(context, 24),
          //     colorFilter: const ColorFilter.mode(
          //       Color(0xff484C52),
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   activeIcon: SvgPicture.asset(
          //     '',
          //     width: responsiveWidth(context, 24),
          //     height: responsiveHeight(context, 24),
          //     colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
          //   ),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppConstant.historyIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: const ColorFilter.mode(
                Color(0xff484C52),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppConstant.historyIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppConstant.profileIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: const ColorFilter.mode(
                Color(0xff484C52),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppConstant.profileIcon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
