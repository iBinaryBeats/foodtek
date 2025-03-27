import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtek/core/utils/app_constants.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/dashboard/presentation/screens/custom_navigation_bar_screen.dart';
import 'package:foodtek/features/dashboard/presentation/screens/home_screen.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ValueNotifier<bool> pushNotifications = ValueNotifier<bool>(true);
  final ValueNotifier<bool> promotionalNotifications = ValueNotifier<bool>(
    false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        title: Row(
          children: [
            IconButton(
              onPressed:
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationBarScreen(),
                    ),
                  ),
              icon: Icon(Icons.arrow_back, fill: 1.0),
            ),
            const Text('Profile'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: responsiveHeight(context, 20)),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              backgroundImage: AssetImage(AppConstant.avatarIconPng),
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            const Text(
              'Ahmad Daboor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'ahmad1709@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  _buildSectionTitle('My Account'),
                  _buildAccountTile(
                    Icons.person,
                    'Personal information',
                    onTap: () {},
                  ),

                  _buildAccountTile(
                    Icons.language,
                    'Language',
                    trailingText: 'EN',
                    onTap: () {},
                  ),
                  _buildAccountTile(
                    Icons.privacy_tip,
                    'Privacy Policy',
                    onTap: () {},
                  ),
                  _buildAccountTile(Icons.settings, 'Setting', onTap: () {}),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(context, 24)),

            // Notifications Section
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  _buildSectionTitle('Notifications'),
                  _buildSwitchTile(
                    Icons.notifications,
                    'Push Notifications',
                    pushNotifications,
                  ),
                  _buildSwitchTile(
                    Icons.notifications_none,
                    'Promotional Notifications',
                    promotionalNotifications,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // More Section
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  _buildSectionTitle('More'),
                  _buildAccountTile(
                    Icons.help_outline,
                    'Help Center',
                    onTap: () {},
                  ),

                  // Log out button
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: responsiveHeight(context, 50)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildAccountTile(
    IconData icon,
    String title, {
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing:
          trailingText != null
              ? Text(trailingText)
              : const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(
    IconData icon,
    String title,
    ValueNotifier<bool> notifier,
  ) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (context, value, _) {
        return ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Container(
            width: 30,
            height: 18,
            child: CupertinoSwitch(
              value: value,

              onChanged: (val) {
                notifier.value = val;
              },
            ),
          ),
        );
      },
    );
  }
}
