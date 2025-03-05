import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/authentication/presentation/screens/otp_screen.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();

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

              Center(
                child: Container(
                  width: responsiveWidth(context, 343),
                  padding: const EdgeInsets.all(20),
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
                      const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: responsiveHeight(context, 12)),
                      Text(
                        'Enter your E-mail or phone and we’ll send you a link to get back into\n your account',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: responsiveHeight(context, 24)),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: responsiveHeight(context, 24)),

                      CustomButton(
                        text: 'Send',
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(),
                            ),
                          );
                        },
                        buttonColor: AppColors.green,
                      ),
                    ],
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
