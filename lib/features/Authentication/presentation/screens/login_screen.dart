import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/Authentication/presentation/widgets/custom_form_field.dart';
import 'package:foodtek/features/Authentication/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(AppConstant.patternPath),

            Positioned.fill(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: responsiveHeight(context, 74)),
                    Container(
                      width: responsiveWidth(context, 307),
                      height: responsiveHeight(context, 85),

                      child: SvgPicture.asset(AppConstant.logoPath),
                    ),
                    SizedBox(height: responsiveHeight(context, 42)),
                    Container(
                      height: responsiveHeight(context, 661),
                      width: responsiveWidth(context, 343),
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 24),
                          vertical: responsiveHeight(context, 24),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: responsiveHeight(context, 12)),
                            RichText(
                              text: TextSpan(
                                text: 'Don\'t have an account?  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyC,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            print('text');
                                          },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: responsiveHeight(context, 24)),

                            CustomFormField(label: 'Email'),
                            SizedBox(height: responsiveHeight(context, 16)),

                            CustomFormField(
                              label: 'Password',
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
