import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/onboarding/domain/entities/on_boarding_card.dart';
import 'package:foodtek/features/onboarding/presentation/screens/choose_location_screen.dart';
import 'package:foodtek/features/onboarding/presentation/widgets/on_boarding_content.dart';

import '../widgets/on_boarding_dots.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageViewController = PageController();
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

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          // Background Image - takes full screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              child: SvgPicture.asset(
                AppConstant.patternPath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: responsiveHeight(context, 150)),
                // Container with shadow effect
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
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return OnBoardingContent(
                              card: onBoardingCards[index],
                              onContinue: () {
                                if (onBoardingCards.length - 1 ==
                                    _currentPage) {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) => ChooseLocationScreen(),
                                      transitionsBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.easeInOut;

                                        var tween = Tween(
                                          begin: begin,
                                          end: end,
                                        ).chain(CurveTween(curve: curve));
                                        var offsetAnimation = animation.drive(
                                          tween,
                                        );

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                }
                                _pageViewController.nextPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.fastOutSlowIn,
                                );
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => ChooseLocationScreen(),
                                    transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;

                                      var tween = Tween(
                                        begin: begin,
                                        end: end,
                                      ).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(
                                        tween,
                                      );

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Text('Skip'),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...List.generate(
                                  onBoardingCards.length,
                                  (index) => OnBoardingDot(
                                    isActive: index == _currentPage,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                _pageViewController.nextPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );

                                if (onBoardingCards.length - 1 ==
                                    _currentPage) {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) => ChooseLocationScreen(),
                                      transitionsBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.easeInOut;

                                        var tween = Tween(
                                          begin: begin,
                                          end: end,
                                        ).chain(CurveTween(curve: curve));
                                        var offsetAnimation = animation.drive(
                                          tween,
                                        );

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
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
