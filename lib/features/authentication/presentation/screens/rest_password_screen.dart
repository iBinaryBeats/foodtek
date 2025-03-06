import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/Authentication/presentation/screens/login_screen.dart';
import 'package:foodtek/features/widgets/custom/custom_button.dart';

class RestPassword extends StatelessWidget {
  RestPassword({super.key});

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(AppConstant.patternPath),
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: responsiveHeight(context, 70)),
                  SvgPicture.asset(AppConstant.logoPath),
                  SizedBox(height: responsiveHeight(context, 46)),
                  Container(
                    height: responsiveHeight(context, 423),
                    width: responsiveWidth(context, 343),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveHeight(context, 15),
                        vertical: responsiveHeight(context, 15),
                      ),
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
                            'Rest Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                'Want to try with my current password?',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyC,
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
                                    fontSize: 12,
                                    color: AppColors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('New Password'),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  decoration: _inputDecoration(
                                    "Enter new password",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    if (value.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: responsiveHeight(context, 16)),
                                _buildLabel('Confirm new Password'),

                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  decoration: _inputDecoration(
                                    "Confirm new password",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: responsiveHeight(context, 24)),
                                CustomButton(
                                  text: 'Update Password',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    //_formKey.currentState!.validate()
                                    if (_formKey.currentState!.validate()) {
                                      //TODO : THE LOGIC
                                      Dialog(
                                        child: Column(children: [Text('a')]),
                                      );
                                    }
                                  },
                                  buttonColor: AppColors.green,
                                ),
                              ],
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
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey[600],
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      errorStyle: const TextStyle(height: 0),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }
}

/*
  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      errorStyle: const TextStyle(height: 0),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }
}
/*
      return Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_backspace_sharp,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  const Text(
                                    "Rest Password",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Text(
                                        "Want to try with my current password? ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.grey[600],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(width: 4),
                                      GestureDetector(
                                        onTap: () {
                                          // Add navigation to login screen
                                        },
                                        child: const Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  _buildLabel("New Password"),
                                  const SizedBox(height: 3),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    obscuringCharacter: "*",
                                    decoration: _inputDecoration(
                                      "Enter new password",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildLabel("Confirm New Password"),
                                  const SizedBox(height: 3),
                                  TextFormField(
                                    controller: _confirmPasswordController,
                                    obscureText: true,
                                    obscuringCharacter: "*",
                                    decoration: _inputDecoration(
                                      "Confirm new password",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please confirm your password';
                                      }
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // TODO: Handle password reset logic
                                        }
                                      },
                                      child: const Text(
                                        "Update Password",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );

 */
 */
