import 'package:flutter/material.dart';
import 'package:foodtek/features/onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:foodtek/features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const FoodTek());
}

class FoodTek extends StatelessWidget {
  const FoodTek({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Inter'),
          bodyMedium: TextStyle(fontFamily: 'Inter'),
          bodySmall: TextStyle(fontFamily: 'Inter'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
