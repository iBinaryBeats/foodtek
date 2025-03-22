import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/Authentication/presentation/screens/login_screen.dart';
import 'package:foodtek/features/Authentication/presentation/widgets/custom_form_field.dart';
import 'package:foodtek/features/Authentication/presentation/widgets/custom_text_field.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  //  height: responsiveHeight(context, 672),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 24),
                      vertical: responsiveHeight(context, 10),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: SvgPicture.asset(
                                  AppConstant.iconBackPath,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: responsiveHeight(context, 24)),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: responsiveHeight(context, 9)),
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
                          SizedBox(height: responsiveHeight(context, 24)),
                          //Buttons implements here
                          CustomTextField(
                            label: 'Full Name',
                            // validator: (value) {
                            //   if (value == null || value == '') {
                            //     return 'Your Name Cannot Be Empty ';
                            //   } else if (value.length < 5) {
                            //     return 'Enter your full name ';
                            //   }
                            //   return null;
                            // },
                            controller: fullNameController,
                          ),
                          SizedBox(height: responsiveHeight(context, 24)),
                          CustomTextField(
                            label: 'Email',
                            // validator: (value) {
                            //   if (value == null || value == '') {
                            //     return 'Email cannot be empty ';
                            //   }
                            //   return null;
                            // },
                            controller: emailController,
                          ),
                          SizedBox(height: responsiveHeight(context, 24)),

                          CustomTextField(
                            label: 'Birth of Date',
                            controller: birthDateController,
                            // validator: (value) {
                            //   if (value == null || value == '') {
                            //     return 'Your Birth of date cannot be empty';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.datetime,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                AppConstant.iconCalendarPath,
                              ),
                            ),
                          ),
                          SizedBox(height: responsiveHeight(context, 24)),

                          CustomTextField(
                            prefixIcon: CountryCodePicker(
                              onChanged: print,
                              initialSelection: 'JO',
                              favorite: ['962', 'JO'],
                            ),
                            label: 'Phone Number',
                            keyboardType: TextInputType.phone,

                            controller: phoneController,
                          ),
                          SizedBox(height: responsiveHeight(context, 23)),

                          CustomTextField(
                            label: 'Set Password',
                            obsecureText: true,
                            // validator: (value) {
                            //   if (value == null || value == '') {
                            //     return 'Password Cannot be empty';
                            //   } else if (value.length < 8) {
                            //     return 'Your Password must be at least 8 Letters';
                            //   }
                            //   return null;
                            // },
                            controller: passwordController,
                            suffixIcon: IconButton(
                              onPressed: () {
                                //TODO
                              },
                              icon: SvgPicture.asset(AppConstant.iconEyeOff),
                            ),
                          ),

                          SizedBox(height: responsiveHeight(context, 30)),

                          CustomButton(
                            text: 'Register',
                            textColor: Colors.white,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                              //TODO
                            },
                            buttonColor: AppColors.green,
                          ),
                        ],
                      ),
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
