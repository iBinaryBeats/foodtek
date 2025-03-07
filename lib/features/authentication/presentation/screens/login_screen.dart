import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/Authentication/presentation/screens/sign_up_screen.dart';
import 'package:foodtek/features/Authentication/presentation/widgets/custom_form_field.dart';
import 'package:foodtek/features/authentication/presentation/screens/forget_password_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/home_screen.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primary,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          SvgPicture.asset(AppConstant.patternPath),

          Positioned.fill(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: responsiveHeight(context, 65)),
                  Container(
                    width: responsiveWidth(context, 307),
                    height: responsiveHeight(context, 100),
                    child: SvgPicture.asset(AppConstant.logoPath),
                  ),
                  SizedBox(height: responsiveHeight(context, 42)),
                  Container(
                    height: responsiveHeight(context, 680),
                    width: responsiveWidth(context, 343),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 16),
                        vertical: responsiveHeight(context, 8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32.sp,
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SignUp(),
                                            ),
                                          );
                                        },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: responsiveHeight(context, 12)),

                          CustomFormField(label: 'Email', hintText: 'Email'),
                          SizedBox(height: responsiveHeight(context, 12)),

                          CustomFormField(
                            label: 'Password',
                            hintText: 'Password',
                            obscureText: true,
                          ),
                          SizedBox(height: responsiveHeight(context, 12)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: AppColors.green,
                                onChanged: (bool? value) {
                                  // State change cannot be done here, as this is now a StatelessWidget.
                                  // You may need to lift this state up to a parent widget or use another state management solution.
                                },
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.greyC,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgetPassword(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: responsiveHeight(context, 18)),

                          CustomButton(
                            text: 'Log In',
                            textColor: Colors.white,
                            buttonColor: AppColors.green,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: responsiveHeight(context, 24)),
                          Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(context, 8),
                                ),
                                child: Text('Or'),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                          SizedBox(height: responsiveHeight(context, 15)),

                          CustomButton(
                            imagePath: 'assets/icons/google.svg',
                            text: 'Continue with Google',
                            textColor: Colors.black,
                            onPressed: () {
                              // TODO
                            },
                            buttonColor: Colors.white,
                          ),
                          SizedBox(height: responsiveHeight(context, 12)),
                          CustomButton(
                            imagePath: 'assets/icons/facebook.svg',
                            text: 'Continue with Facebook',
                            textColor: Colors.black,
                            onPressed: () {
                              // TODO
                            },
                            buttonColor: Colors.white,
                          ),
                          SizedBox(height: responsiveHeight(context, 10)),
                          CustomButton(
                            imagePath: 'assets/icons/apple.svg',
                            text: 'Continue with Apple',
                            textColor: Colors.black,
                            onPressed: () {
                              // TODO
                            },
                            buttonColor: Colors.white,
                          ),
                          Spacer(),
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
    );
  }
}
