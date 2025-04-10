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

import '../../../../core/utils/helper/validator.dart';
import '../../../dashboard/presentation/screens/custom_navigation_bar_screen.dart';
import '../../../dashboard/presentation/screens/home_screen.dart';
import '../../../widgets/bottomsheet/errors_bottom_sheet.dart';

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
                SizedBox(height: responsiveHeight(context, 65)),
                SvgPicture.asset(AppConstant.logoPath),
                SizedBox(height: responsiveHeight(context, 30)),
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
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 32.sp,
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
                          CustomTextField(
                            obscureText: false,
                            label: 'Full Name',
                            controller: fullNameController,
                          ),
                          SizedBox(height: responsiveHeight(context, 8)),
                          CustomTextField(
                            obscureText: false,
                            label: 'Email',

                            controller: emailController,
                          ),
                          SizedBox(height: responsiveHeight(context, 8)),

                          CustomTextField(
                            obscureText: false,
                            label: 'Birth of Date',
                            controller: birthDateController,
                            keyboardType: TextInputType.datetime,

                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                AppConstant.iconCalendarPath,
                              ),
                            ),
                          ),
                          SizedBox(height: responsiveHeight(context, 8)),

                          CustomTextField(
                            obscureText: false,
                            prefixIcon: Container(
                              width: 125,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CountryCodePicker(
                                    showCountryOnly: true,
                                    showOnlyCountryWhenClosed: true,
                                    showDropDownButton: true,
                                    showFlag: true,
                                    showFlagDialog: true,
                                    hideMainText: true,
                                    padding: EdgeInsets.zero,
                                    onChanged: print,
                                    initialSelection: 'JO',
                                    favorite: ['962', 'JO'],
                                  ),
                                ],
                              ),
                            ),
                            label: 'Phone Number',
                            keyboardType: TextInputType.phone,

                            controller: phoneController,
                          ),
                          SizedBox(height: responsiveHeight(context, 8)),

                          CustomTextField(
                            label: 'Set Password',
                            obscureText: true,
                            controller: passwordController,
                          ),

                          SizedBox(height: responsiveHeight(context, 30)),

                          CustomButton(
                            text: 'Register',
                            textColor: Colors.white,
                            onPressed: () {
                              List<String> userInputValidator = [];

                              String? cathIssue = Validator.validateUsername(
                                fullNameController.text.trim(),
                              );
                              if (cathIssue != null) {
                                userInputValidator.add(cathIssue);
                              }
                              cathIssue = Validator.validateEmail(
                                emailController.text.trim(),
                              );

                              if (cathIssue != null) {
                                userInputValidator.add(cathIssue);
                              }
                              cathIssue = Validator.validateNotEmpty(
                                fieldName: 'Birth of Date',
                                birthDateController.text.trim(),
                              );

                              if (cathIssue != null) {
                                userInputValidator.add(cathIssue);
                              }

                              cathIssue = Validator.validatePhone(
                                phoneController.text.trim(),
                              );

                              if (cathIssue != null) {
                                userInputValidator.add(cathIssue);
                              }

                              cathIssue = Validator.validatePassword(
                                passwordController.text.trim(),
                              );

                              if (cathIssue != null) {
                                userInputValidator.add(cathIssue);
                              }

                              if (userInputValidator.isEmpty) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            NavigationBarScreen(initialPage: 0),
                                  ),
                                );
                              } else {
                                showModalBottomSheet(
                                  context: context,
                                  builder:
                                      (context) => ErrorsBottomSheet(
                                        buttonColor: Colors.red,
                                        title: 'Something Went Wrong ',
                                        message: userInputValidator.join('\n'),
                                        iconPath: AppConstant.wrongIcon,
                                        onTap: () => Navigator.pop(context),
                                      ),
                                );
                              }
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
