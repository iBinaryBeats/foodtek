import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/onboarding/domain/entities/on_boarding_card.dart';
import 'package:foodtek/features/onboarding/presentation/screens/choose_location_screen.dart';
import 'package:foodtek/features/onboarding/presentation/widgets/on_boarding_content.dart';
import '../widgets/on_boarding_dots.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  final PageController _pageViewController = PageController();
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  final List<OnBoardingCard> onBoardingCards = [
    OnBoardingCard(
      imagePath: 'assets/icons/on_boarding_first.svg',
      title: 'Welcome To Sahlah',
      descirption:
          'Enjoy a fast and Smooth Food Delivery \nAt your doorstep\n ',
    ),
    OnBoardingCard(
      imagePath: 'assets/icons/on_boarding_second.svg',
      title: 'Get Delivery On Time ',
      descirption:
          'Order your favorite food within the\nPlam of your hand and the zone\nOf your comfort',
    ),
    OnBoardingCard(
      imagePath: 'assets/icons/on_boarding_second.svg',
      title: 'Choose Your Food ',
      descirption:
          'Order your favorite food within the\nPlam of your hand and the zone\nOf your comfort',
    ),
  ];

  void _goToLocationScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => ChooseLocationScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppConstant.patternPath, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: responsiveHeight(context, 150)),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 16),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 12,
                        blurRadius: 15,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: responsiveHeight(context, 666),
                        width: responsiveWidth(context, 335),
                        child: PageView.builder(
                          controller: _pageViewController,
                          itemCount: onBoardingCards.length,
                          onPageChanged: (index) {
                            currentPageNotifier.value = index;
                          },
                          itemBuilder: (context, index) {
                            return OnBoardingContent(
                              card: onBoardingCards[index],
                              onContinue: () {
                                if (index == onBoardingCards.length - 1) {
                                  _goToLocationScreen(context);
                                } else {
                                  _pageViewController.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: responsiveHeight(context, 45)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 8),
                        ),
                        child: ValueListenableBuilder<int>(
                          valueListenable: currentPageNotifier,
                          builder:
                              (context, currentPage, child) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed:
                                        () => _goToLocationScreen(context),
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                        color: Color(0xff455A64),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                      onBoardingCards.length,
                                      (index) => OnBoardingDot(
                                        isActive: index == currentPage,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (currentPage ==
                                          onBoardingCards.length - 1) {
                                        _goToLocationScreen(context);
                                      } else {
                                        _pageViewController.nextPage(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.linear,
                                        );
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/arrow_icon_button.svg',
                                    ),
                                  ),
                                ],
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
