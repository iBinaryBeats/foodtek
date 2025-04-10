import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/authentication/presentation/screens/rest_password_screen.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/helper/validator.dart';
import '../../../widgets/bottomsheet/errors_bottom_sheet.dart';
import '../widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  ValueNotifier<bool> isCorrect = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: SvgPicture.asset(AppConstant.patternPath, fit: BoxFit.cover),
          ),

          // Content
          Column(
            children: [
              SizedBox(height: responsiveHeight(context, 72)),
              Center(child: SvgPicture.asset(AppConstant.logoPath)),
              SizedBox(height: responsiveHeight(context, 152)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 43),
                ),
                child: Center(
                  child: Container(
                    //   width: responsiveWidth(context, 343),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: responsiveHeight(context, 30),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(AppConstant.iconBackPath),
                            ),
                            const Text.rich(
                              TextSpan(
                                text: 'Back to ',
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.green,
                                    ),
                                  ),
                                  TextSpan(text: ' page?'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: responsiveHeight(context, 25)),
                        Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: responsiveHeight(context, 12)),
                        Text(
                          'Enter your E-mail or phone and we’ll send you a link to get back into\n your account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: responsiveHeight(context, 24)),
                        CustomTextField(
                          statusOfTitle: 1,
                          obscureText: false,
                          controller: emailController,
                          label: 'Email',
                        ),
                        SizedBox(height: responsiveHeight(context, 24)),

                        CustomButton(
                          text: 'Send',
                          textColor: Colors.white,
                          onPressed: () {
                            List<String> userInputValidator = [];
                            String? cathIssue = Validator.validateEmail(
                              emailController.text.trim(),
                            );
                            if (cathIssue != null) {
                              userInputValidator.add(cathIssue);
                            }

                            if (userInputValidator.isEmpty) {
                              TextEditingController verifyNumber =
                                  TextEditingController();
                              showDialog(
                                barrierDismissible:
                                    false, //user cannot interact outside the screen
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        //        horizontal: responsiveWidth(context, 25),
                                        //       vertical: responsiveHeight(context, 90),
                                      ),
                                      child: Container(
                                        width: responsiveWidth(context, 343),
                                        height: responsiveHeight(context, 525),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Spacer(),
                                              SvgPicture.asset(
                                                AppConstant.sentMessagePath,
                                              ),
                                              SizedBox(
                                                height: responsiveHeight(
                                                  context,
                                                  12,
                                                ),
                                              ),
                                              Text(
                                                'A 4-digit code has been sent to your email.\nPlease enter it to verify.',

                                                textAlign: TextAlign.center,

                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: responsiveHeight(
                                                  context,
                                                  24,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: ValueListenableBuilder<
                                                  bool
                                                >(
                                                  valueListenable: isCorrect,
                                                  builder: (
                                                    context,
                                                    value,
                                                    child,
                                                  ) {
                                                    return PinCodeTextField(
                                                      controller: verifyNumber,

                                                      pinTheme: PinTheme(
                                                        inactiveColor:
                                                            Colors.grey[300],
                                                        activeColor:
                                                            isCorrect.value
                                                                ? AppColors
                                                                    .green
                                                                : Colors.red,
                                                        fieldHeight:
                                                            responsiveHeight(
                                                              context,
                                                              50,
                                                            ),
                                                        fieldWidth:
                                                            responsiveHeight(
                                                              context,
                                                              50,
                                                            ),
                                                        shape:
                                                            PinCodeFieldShape
                                                                .box,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                      ),

                                                      keyboardType:
                                                          TextInputType.number,
                                                      appContext: context,
                                                      length: 4,

                                                      onChanged: (value) {},
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: responsiveHeight(
                                                  context,
                                                  24,
                                                ),
                                              ),
                                              CustomButton(
                                                text: 'Verify',
                                                textColor: Colors.white,
                                                onPressed: () {
                                                  //TODO
                                                  if (verifyNumber.text
                                                          .toString()
                                                          .trim() ==
                                                      '1234') {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                RestPassword(),
                                                      ),
                                                    );
                                                  } else {
                                                    isCorrect.value = false;
                                                  }
                                                },
                                                buttonColor: AppColors.green,
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
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

              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
