import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.displayDash});
  int displayDash = 0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 18),
          vertical: responsiveHeight(context, 12),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [SizedBox(height: responsiveHeight(context, 20))],
          ),
        ),
      ),
    );
  }
}
