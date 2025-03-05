import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/Authentication/presentation/screens/sign_up_screen.dart';
import 'package:foodtek/features/Authentication/presentation/widgets/custom_form_field.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

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
                            SizedBox(height: responsiveHeight(context, 20)),

                            CustomFormField(label: 'Email', hintText: 'Email'),
                            SizedBox(height: responsiveHeight(context, 16)),

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
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontSize: 12,

                                    color: AppColors.greyC,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    //TODO
                                  },
                                  child: Text(
                                    'Forgot Password ?',
                                    style: TextStyle(
                                      fontSize: 12,
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
                                //TODO
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
                            SizedBox(height: responsiveHeight(context, 20)),

                            CustomButton(
                              imagePath: 'assets/icons/google.svg',

                              text: 'Continue with Google',
                              textColor: Colors.black,
                              onPressed: () {
                                //TODO
                              },
                              buttonColor: Colors.white,
                            ),
                            SizedBox(height: responsiveHeight(context, 12)),
                            CustomButton(
                              imagePath: 'assets/icons/facebook.svg',
                              text: 'Continue with Facebook',
                              textColor: Colors.black,
                              onPressed: () {
                                //TODO
                              },
                              buttonColor: Colors.white,
                            ),
                            SizedBox(height: responsiveHeight(context, 10)),
                            CustomButton(
                              imagePath: 'assets/icons/apple.svg',
                              text: 'Continue with Apple',
                              textColor: Colors.black,
                              onPressed: () {
                                //TODO
                              },
                              buttonColor: Colors.white,
                            ),

                            /*CustomButton(
                              text: 'Continue with Google',
                              textColor: Colors.black,
                              buttonColor: Colors.white,
                              onPressed: () {},
                            ),

                             */
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
