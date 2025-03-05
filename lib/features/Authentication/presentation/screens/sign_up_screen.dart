import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/Authentication/presentation/screens/login_screen.dart';
import 'package:foodtek/features/Authentication/presentation/widgets/custom_form_field.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Stack(
        children: [
          SvgPicture.asset(AppConstant.patternPath),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: responsiveHeight(context, 74)),
                SvgPicture.asset(AppConstant.logoPath),
                SizedBox(height: responsiveHeight(context, 42)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: responsiveWidth(context, 343),
                  height: responsiveHeight(context, 672),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 24),
                      vertical: responsiveHeight(context, 24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [Icon(Icons.arrow_back)]),
                        SizedBox(height: responsiveHeight(context, 24)),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: AppColors.textColorGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomFormField(label: 'Full Name'),
                        SizedBox(height: responsiveHeight(context, 16)),
                        CustomFormField(label: 'Email'),
                        SizedBox(height: responsiveHeight(context, 16)),
                        CustomFormField(label: 'Birth of date'),
                        SizedBox(height: responsiveHeight(context, 16)),
                        CustomFormField(label: 'Phone Number'),
                        SizedBox(height: responsiveHeight(context, 16)),
                        CustomFormField(label: 'Password'),
                        CustomButton(
                          text: 'Register',
                          textColor: Colors.white,
                          onPressed: () {
                            //TODO
                          },
                          buttonColor: AppColors.green,
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
    );
  }
}
